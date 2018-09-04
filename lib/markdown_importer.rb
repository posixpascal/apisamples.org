class MarkdownImporter
  def is_new? file
    true
  end

  def import file
    tree = parse file
    puts tree[:meta][:title]
  end

  private def parse file
    tree = {}
    cursor = nil
    meta = {
    }

    open(file, "r") do |f|
      markdown_source = f.read
      document = Kramdown::Document.new(markdown_source)
      nodes = document.root.children

      # Iterate over markdown block
      nodes.each do |node|

        # Is node the first "-------------"
        if node.type == :hr and node.value.nil?
          if cursor.nil?
            cursor = :meta
          end
          next
        end

        # meta tags
        if node.type == :p and cursor == :meta
          node.children.each do |meta_node|
            next unless meta_node.type == :text
            meta_strings = meta_node.value.split("\n")
            meta_strings.each do |meta_string|
              data = parse_meta_line meta_string
              meta[data[:key].to_sym] = data[:value]
            end
          end
          cursor = :parsed
          tree[:meta] = meta
          next
        end
      end

      # code samples
      # TODO: Parsing this code block with kramdown isnt directly supported so I fall back to regex
      payload = markdown_source.match(/```(json|xml)(.+)```/m)[1]
      tree[:code] = payload
    end
    tree
  end

  private def parse_meta_line meta_string
    {
      key: meta_string.match(/(\w+)/)[1].strip(),
      value: meta_string.match(/:(.+)/)[1].strip()
    }
  end
end
# Generate a few sample providers
#

Provider.create([
                    {
                        name: "Twitter",
                        website: "https://twitter.com"
                    },
                    {
                        name: "Github",
                        website: "https://github.com"
                    },
                    {
                        name: "Facebook",
                        website: "https://facebook.com"
                    }
                ])

# Generate a few twitter examples
#

twitter_provider = Provider.find_by_name("Twitter")

Example.create([
                   {
                       title: "Tweet Object",
                       summary: "A payload from the Twitter REST API",
                       provider: twitter_provider,
                       payload: {
                           created_at: "Thu Apr 06 15:24:15 +0000 2017",
                           id_str: "850006245121695744",
                           text: "1\/ Today we\u2019re sharing our vision for the future of the Twitter API platform!\nhttps:\/\/t.co\/XweGngmxlP",
                           user: {
                               id: 2244994945,
                               name: "Twitter Dev",
                               screen_name: "TwitterDev",
                               location: "Internet",
                               url: "https:\/\/dev.twitter.com\/",
                               description: "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https:\/\/twittercommunity.com\/ \u2328\ufe0f #TapIntoTwitter"
                           },
                           place: {
                           },
                           entities: {
                               hashtags: [
                               ],
                               urls: [
                                   {
                                       url: "https:\/\/t.co\/XweGngmxlP",
                                       unwound: {
                                           url: "https:\/\/cards.twitter.com\/cards\/18ce53wgo4h\/3xo1c",
                                           title: "Building the Future of the Twitter API Platform"
                                       }
                                   }
                               ],
                               user_mentions: [
                               ]
                           }
                       }
                   }
               ])
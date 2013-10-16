This is an irc robot for irc://irc.freenode.net/sfpc and http://sfpc.io

Install dependencies with `npm install`

Then you can mess with bot.coffee (make sure to change the nickname!)

To test your bot out, change the nickname and do `npm start`

The bot has two functions, `onMessage` and `onPrivateMessage`, which each take a [regular expression][1] to filter on specific messages, and a callback that should return a message to send back. The simplest bot may look like this:

```coffee
sfpcbot = require './lib/sfpcbot'
shibu = new sfpcbot.bot 'simplebot'

shibu.onMessage /.*/, (from, to, message) ->
    "wow so message so wow"
```

That shibu bot will send a message, every time it hears any chatter. While it's enthusiasm is admirable, lets make something that understands basic American conversational greetings:

```coffee
sfpcbot = require './lib/sfpcbot'
nicebot = new sfpcbot.bot 'nicebot'

nicebot.onMessage /hello/i, (from, to, message) ->
    "Hello #{from}"
```

 If you are new to [regular expressions][1], the `i` after the `/hello/` is not a typo - it says **i**gnore the case of the message. So now our bot only says hello when someone else says "hello" or "Hello" or "HeLlO", and even says your name back!

Other things to note about the bot, is that everything it hears will be logged to a file `sfpc.log`. If you want to see/edit the magic, check out `lib/sfpcbot.coffee`.

Feel free to make your own bots, add [issues][2] or submit pull requests to the main sfpcbot!

[1]: http://codular.com/regex
[2]: http://github.com/jedahan/sfpcbot
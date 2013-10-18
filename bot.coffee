sfpc = require './lib/sfpcbot'
bot = new sfpc.Bot 'sfpcbot-dev'

# This bot can respond to messages, or private messages
# On those events, we must use a regular expression to filter, and respond with a string
bot.on /hello|hola|salut|sup|hi/i, (from, to, message) ->
    "HELLO COMRADE #{from}"

bot.on /help/i,(from, to, message) ->
    'my brain can be found https://github.com/jedahan/sfpcbot'
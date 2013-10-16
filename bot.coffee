sfpc = require './lib/sfpcbot'
bot = new sfpc.Bot 'sfpcbot-dev'

# This bot can respond to messages, or private messages
# On those events, we must use a regular expression to filter, and respond with a string
bot.onMessage /[hello|hola|salut|sup|hi]/i, (from, to, message) ->
    "HELLO COMRADE #{from}"

bot.onPrivateMessage /help/i,(from, message) ->
    'i cannot help you right now'
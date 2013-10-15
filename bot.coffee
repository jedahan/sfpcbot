irc = require 'irc'

# please only mess around in our own channel!
bot = new irc.Client 'irc.freenode.net', 'sfpcbot', {channels: ['#sfpc']}

# The way this bot works, is by listening to events, which can be
#   'message', 'pm', 'error' and theres a few others

# 'message' is for any message
bot.addListener 'message', (from, to, message) ->
    log from, message
    # if the message contains
    if /sfpcbot/.test(message) and /[hello|hola|salut|sup|hi]/.test(message)
        bot.say '#sfpc', 'HELLO COMRADE ' + from

# 'pm' is for private messages
bot.addListener 'pm', (from, message) ->
    log from, message 
    if /help/i.test message
        bot.say from, 'i cannot help you right now'

# sometimes the irc channel sends error events
bot.addListener 'error', (message) -> log 'error', message


log = (from, message) -> console.log from + " => " + message
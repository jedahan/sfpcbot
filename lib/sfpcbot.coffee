irc = require 'irc'
fs = require 'fs'

# This is a simple wrapper around the node irc library
exports.Bot = (nick) ->
    bot = new irc.Client 'irc.freenode.net', nick, {channels: ['#sfpc']}

    bot.onMessage = (regex, callback) ->
        bot.addListener 'message', (from, to, message) ->
            if regex.test message
                bot.say '#sfpc', callback from, to, message

    bot.onPrivateMessage = (regex, callback) ->
        bot.addListener 'pm', (from, message) ->
            if regex.test message
                bot.say from, callback from, to, message

    # log all messages to a file
    bot.addListener 'message', (from, to, message) -> log from, message
    bot.addListener 'pm', (from, message) -> log from, "<pm> #{message}"
    bot.addListener 'error', (message) -> log 'error', message

    # sometimes the irc channel sends error events, so we just print them out
    bot.addListener 'error', (message) -> log 'error', message

    bot

log = (from, to, message) -> fs.appendFile('sfpc.log', "[#{Date.now()}] #{from}: #{message}\n")
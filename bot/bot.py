#!/usr/bin/env python
import random
import types

import telebot
from telebot.types import Message

TOKEN = '999342855:AAGvDry0dDvtflk-dSw3lIkIA6G4tSzeYpQ'
STICKER = [
    'CAADAgADDAADn2dAEs6koQv065hsFgQ',
    'CAADAQADHRIAApl_iALQEEVwd3ygdhYE',
    'CAADAQADpxAAApl_iAIAAZi12d2_ZcUWBA',
    'CAADAgAD2wQAAu90MgbhqA4wnHF7XRYE',
    'CAADAgADRgUAAtZmSQPWmCA6bwfAlhYE',
    'CAADAgADAgAD1elHIsEc9y8FSr_uFgQ',
    'CAADAgADCgADV8u2HgPIYF7OUofjFgQ',
    'CAADAgADAgADkp8eETUZdc2pKL8bFgQ',
    'CAADBQADgwMAAukKyANyw6fyfbOzAAEWBA',
    'CAADBQADhAMAAukKyAPQ5EQgpjzLMxYE',
    'CAADBQADgAMAAukKyAOXWG874z7K-BYE',
    'CAADBQADgQMAAukKyANDdDlhDY7IuRYE',
]

bot = telebot.TeleBot(TOKEN)

smiles = [
    '😂',
    '😘',
    '❤️',
    '😍',
    '😊',
    '😁👍',
    '☺️',
    '😔',
    '😄',
    '😭💋',
    '😒',
    '😳',
    '😱',
    '😝',
    '😢',
    '😃',
    '😉🙈',
    '😜',
]

USERS = {

}


@bot.message_handler(commands=['start', 'help'])
def command_handler(message: Message):
    bot.reply_to(message, 'There is no answer =(')


@bot.message_handler(content_types=["text"])
@bot.edited_message_handler(content_types=["text"])
def echo_digits(message: Message):
    if 'Marinka Makar' in message.text:
        bot.reply_to(message, 'I know Marinka')
        return
    bot.reply_to(message, str(random.random()))


@bot.message_handler(content_types=["voice"])
def message_handler(message: Message):
    bot.reply_to(message, random.choice(smiles))


@bot.message_handler(content_types=["sticker"])
def sticker_handler(message: Message):
    bot.send_sticker(message.chat.id, random.choice(STICKER))


bot.polling(timeout=60)

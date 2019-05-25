import discord
from discord.ext import commands
bot = commands.Bot(command_prefix='!')

@bot.event
async def on_ready():
    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    print('------')

@bot.command()
async def commands(ctx):
	await ctx.send('• • • • • • • • • • • • • ')
	await ctx.send('!kingen ')
	await ctx.send('!echo text ')
	await ctx.send('!cat ')
	await ctx.send('!factorio ')	
	await ctx.send('!kevin ')	
	await ctx.send('• • • • • • • • • • • • • ')
	
@bot.command()
async def kingen(ctx):
	await ctx.send('@Moezenka#6171  är kingen.')

@bot.command()
async def kevin(ctx):
	await ctx.send('https://i.kym-cdn.com/entries/icons/mobile/000/018/433/wojak.jpg')
	
@bot.command()
async def echo(ctx, *, content:str):
    await ctx.send(content)

@bot.command()
async def cat(ctx):
	await ctx.send('https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif')

@bot.command()
async def factorio(ctx):
	await ctx.send('• • • • • • • • • • • • • ')
	await ctx.send('• Factorio ServerName: Potato Central')
	await ctx.send('• Factorio ServerIP: factorio.vahebi.se')
	await ctx.send('• Factorio Password: Empire12')
	await ctx.send('• • • • • • • • • • • • • ')
	
bot.run('NTUyMDM3Njc2NTk3OTAzMzcx.D15ulQ.iRtVrIh6tBYRvqfSDecr8u5YX7Y')

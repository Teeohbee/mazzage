//= require ./phaser.min.js
$(document).on('turbolinks:load', function() {
  const urlPath = $(location).attr("pathname")

  const gameState = {
    musicPlaying: 'off'
  }

  function preload() {
    this.load.image('moley', '/assets/moley.png');
    this.load.image('moley_bg', '/assets/mole_burrow.jpg');
    this.load.audio('theme', 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Tchaikovsky_-_Dance_of_the_Sugar_Plum_Fairy_-_The_Nutcracker.ogg');
  }

  function create() {
    this.add.image(364, 256, 'moley_bg');
    gameState.moley = this.add.sprite(100, 300, 'moley')
    gameState.musicText = this.add.text(650, 475, 'Music')
    gameState.cursors = this.input.keyboard.createCursorKeys();
    gameState.musicText.setInteractive()
    gameState.music = this.sound.add('theme')

    gameState.musicText.on('pointerup', function () {
      if (gameState.musicPlaying == 'off') {
        gameState.music.play()
        gameState.musicPlaying = 'on'
      } else {
        gameState.music.stop()
        gameState.musicPlaying = 'off'
      }
    })
  }

  function update() {
    // Update based on keypress here!
   if (gameState.cursors.right.isDown) {
     if(gameState.moley.flipX == true) {
       gameState.moley.x += 5;
     } else {
       gameState.moley.toggleFlipX();
       gameState.moley.x += 5;
     }
   }
   if (gameState.cursors.left.isDown) {
     if(gameState.moley.flipX == false) {
       gameState.moley.x -= 5;
     } else {
       gameState.moley.toggleFlipX();
       gameState.moley.x -= 5;
     } }
   if (gameState.cursors.up.isDown) {
     gameState.moley.y -= 5;
   }
   if (gameState.cursors.down.isDown) {
     gameState.moley.y += 5;
   }
  }

  const config = {
    parent: 'idofcontainer',
  	type: Phaser.AUTO,
  	width: 728,
  	height: 512,
  	backgroundColor: "#5f2a55",
  	scene: {
      preload,
      create,
      update
  	}
  }

  if(urlPath == "/pages/gam") {
    const game = new Phaser.Game(config)
  }
})

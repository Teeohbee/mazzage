//= require ./phaser.min.js

const gameState = {
  musicPlaying: 'off'
}

function preload() {
  this.load.image('codey', '/assets/moley.png');
  this.load.audio('theme', 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Tchaikovsky_-_Dance_of_the_Sugar_Plum_Fairy_-_The_Nutcracker.ogg');
}

function create() {
  gameState.codey = this.add.sprite(150, 200, 'codey')
  gameState.musicText = this.add.text(340, 470, 'Music')
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
   if(gameState.codey.flipX == true) {
     gameState.codey.x += 5;
   } else {
     gameState.codey.toggleFlipX();
     gameState.codey.x += 5;
   }
 }
 if (gameState.cursors.left.isDown) {
   if(gameState.codey.flipX == false) {
     gameState.codey.x -= 5;
   } else {
     gameState.codey.toggleFlipX();
     gameState.codey.x -= 5;
   } }
 if (gameState.cursors.up.isDown) {
   gameState.codey.y -= 5;
 }
 if (gameState.cursors.down.isDown) {
   gameState.codey.y += 5;
 }
}

const config = {
  parent: 'idofcontainer',
	type: Phaser.AUTO,
	width: 400,
	height: 500,
	backgroundColor: "#5f2a55",
	scene: {
    preload,
    create,
    update
	}
}

const game = new Phaser.Game(config)

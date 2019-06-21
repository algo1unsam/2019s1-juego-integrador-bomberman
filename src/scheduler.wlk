import wollok.game.*

object scheduler{
	var count = 0
	
	method schedule(milliseconds, action) {
		count += 1
		const name = "scheduler" + count
		game.onTick(milliseconds, name, { => action.apply() game.removeTickEvent(name) } )
	}
}
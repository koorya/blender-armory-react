package arm;

class HiddenChildren extends iron.Trait {
	public function new() {
		super();

		notifyOnInit(function() {
			trace("Hide children");
		});

		// notifyOnUpdate(function() {
		// });

		// notifyOnRemove(function() {
		// });
	}
}

package arm;

import iron.system.Input;
import iron.system.Input.Keyboard;
import iron.object.Object;
import iron.Scene;

// Expose this class for easy access from JS
@:expose
class CurrentLevelController extends iron.Trait {
	var current_element = {type: "col", pos: 3};
	// var current_level = [{type: "col", pos: 0}, {type: "col", pos: 1}, {type: "col", pos: 2}];
	var current_level = [];

	public function new() {
		super();

		notifyOnInit(function() {
			this.rebuildByParam();
		});

		notifyOnUpdate(function() {
			if (Input.getKeyboard().started('f'))
				mountCurrentElement();

			if (Input.getKeyboard().started('c')) {
				current_level = [];
				rebuildByParam();
			}
		});

		// notifyOnRemove(function() {
		// });
	}

	public function setCurrentElement(el) {
		this.current_element = el;
		this.rebuildByParam();
	}

	public function resetLevel() {
		this.current_level = [];
		this.rebuildByParam();
	}

	public function mountCurrentElement() {
		if (current_element != null
			&& this.current_level.filter(el -> el.pos == this.current_element.pos && el.type == this.current_element.type).length == 0) {
			this.current_level.push(this.current_element);
			this.current_element = null;
			this.rebuildByParam();
		}
	}

	public function rebuildByParam() {
		var spawner = Scene.active.getChild("spawner");
		var to_remove = spawner.children;

		spawner.children = [];
		for (o in to_remove) {
			trace(o.name);
			o.remove();
		}
		if (this.current_element != null)
			this.spawnElement(this.current_element.type, this.current_element.pos, "glow");
		for (obj in this.current_level) {
			this.spawnElement(obj.type, obj.pos, "solid");
		}
	}

	public function spawnElement(el_type:String, el_pos:Int, el_mat:String) {
		Scene.active.spawnObject('${el_type}_${el_mat}', Scene.active.getChild("spawner"), function(o:Object) {
			o.visible = true;
			o.transform = Scene.active.getChild('${el_type}_${el_pos}').transform;
		});
	}

	public function scene() {
		return iron.Scene.active;
	}
}

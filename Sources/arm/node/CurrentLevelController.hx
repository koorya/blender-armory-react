package arm.node;

@:access(armory.logicnode.LogicNode)@:keep class CurrentLevelController extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _SpawnObject = new armory.logicnode.SpawnObjectNode(this);
		_SpawnObject.preallocInputs(4);
		_SpawnObject.preallocOutputs(2);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.preallocInputs(0);
		_OnInit.preallocOutputs(1);
		armory.logicnode.LogicNode.addLink(_OnInit, _SpawnObject, 0, 0);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.ObjectNode(this, "col_glow"), _SpawnObject, 0, 1);
		var _GetObjectTransform = new armory.logicnode.GetTransformNode(this);
		_GetObjectTransform.preallocInputs(1);
		_GetObjectTransform.preallocOutputs(1);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.ObjectNode(this, "col_1"), _GetObjectTransform, 0, 0);
		armory.logicnode.LogicNode.addLink(_GetObjectTransform, _SpawnObject, 0, 2);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.BooleanNode(this, true), _SpawnObject, 0, 3);
		armory.logicnode.LogicNode.addLink(_SpawnObject, new armory.logicnode.NullNode(this), 0, 0);
		armory.logicnode.LogicNode.addLink(_SpawnObject, new armory.logicnode.ObjectNode(this, ""), 1, 0);
		var _SpawnObject_001 = new armory.logicnode.SpawnObjectNode(this);
		_SpawnObject_001.preallocInputs(4);
		_SpawnObject_001.preallocOutputs(2);
		armory.logicnode.LogicNode.addLink(_OnInit, _SpawnObject_001, 0, 0);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.ObjectNode(this, "col_solid"), _SpawnObject_001, 0, 1);
		var _GetObjectTransform_001 = new armory.logicnode.GetTransformNode(this);
		_GetObjectTransform_001.preallocInputs(1);
		_GetObjectTransform_001.preallocOutputs(1);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.ObjectNode(this, "col_0"), _GetObjectTransform_001, 0, 0);
		armory.logicnode.LogicNode.addLink(_GetObjectTransform_001, _SpawnObject_001, 0, 2);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.BooleanNode(this, true), _SpawnObject_001, 0, 3);
		armory.logicnode.LogicNode.addLink(_SpawnObject_001, new armory.logicnode.NullNode(this), 0, 0);
		armory.logicnode.LogicNode.addLink(_SpawnObject_001, new armory.logicnode.ObjectNode(this, ""), 1, 0);
		var _Print = new armory.logicnode.PrintNode(this);
		_Print.preallocInputs(2);
		_Print.preallocOutputs(1);
		armory.logicnode.LogicNode.addLink(_OnInit, _Print, 0, 0);
		var _GetObjectProperty = new armory.logicnode.GetPropertyNode(this);
		_GetObjectProperty.preallocInputs(2);
		_GetObjectProperty.preallocOutputs(2);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.ObjectNode(this, ""), _GetObjectProperty, 0, 0);
		armory.logicnode.LogicNode.addLink(new armory.logicnode.StringNode(this, "comp_type"), _GetObjectProperty, 0, 1);
		armory.logicnode.LogicNode.addLink(_GetObjectProperty, new armory.logicnode.StringNode(this, ""), 1, 0);
		armory.logicnode.LogicNode.addLink(_GetObjectProperty, _Print, 0, 1);
		armory.logicnode.LogicNode.addLink(_Print, new armory.logicnode.NullNode(this), 0, 0);
	}
}
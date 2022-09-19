// Auto-generated
package ;
class Main {
    public static inline var projectName = 'tower';
    public static inline var projectVersion = '1.0.22';
    public static inline var projectPackage = 'arm';
    public static function main() {
        iron.object.BoneAnimation.skinMaxBones = 8;
            iron.object.LightObject.cascadeCount = 4;
            iron.object.LightObject.cascadeSplitFactor = 0.800000011920929;
        armory.system.Starter.numAssets = 5;
        armory.system.Starter.drawLoading = armory.trait.internal.LoadingScreen.render;
        armory.system.Starter.main(
            'one_level',
            0,
            false,
            true,
            false,
            1080,
            440,
            1,
            true,
            armory.renderpath.RenderPathCreator.get
        );
    }
}

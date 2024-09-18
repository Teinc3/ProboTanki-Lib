package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import flash.geom.Vector3D;
   import §for set super§.§super const continue§;
   
   public class §'!4§
   {
      private static const §^+§:Number = 85 * Math.PI / 180;
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const right:Vector3 = new Vector3();
      
      private static const up:Vector3 = new Vector3();
      
      private static const normal:Vector3 = new Vector3();
      
      private static const §const catch break§:Vector.<Vector3> = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3(),new Vector3(),new Vector3()]);
      
      private static const §break catch if§:Vector3D = new Vector3D();
      
      private static const §include catch use§:Vector3D = new Vector3D();
      
      private var collisionDetector:CollisionDetector;
      
      public function §'!4§(param1:CollisionDetector)
      {
         super();
         this.collisionDetector = param1;
      }
      
      public function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:KDContainer, param6:§<!T§) : Decal
      {
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         direction.diff(param1,param2);
         var _loc9_:Number = direction.length() + 200;
         direction.normalize();
         right.cross2(direction,Vector3.Z_AXIS).normalize();
         up.cross2(right,direction);
         Vector3(§const catch break§[4]).copy(param2);
         Vector3(§const catch break§[0]).copy(param2).addScaled(50,right);
         Vector3(§const catch break§[1]).copy(param2).addScaled(50,up);
         Vector3(§const catch break§[2]).copy(param2).addScaled(-50,right);
         Vector3(§const catch break§[3]).copy(param2).addScaled(-50,up);
         normal.reset(0,0,0);
         for each(_loc7_ in §const catch break§)
         {
            if(this.collisionDetector.raycastStatic(_loc7_,direction,§super const continue§.§finally catch while§,_loc9_,null,§extends const default§))
            {
               normal.add(§extends const default§.normal);
            }
         }
         normal.normalize();
         §+$%§.§with catch return§(param1,§break catch if§);
         §+$%§.§with catch return§(normal,§include catch use§);
         _loc8_ = this.§>#o§(param6);
         return param5.createDecal(§break catch if§,§include catch use§,param3,_loc8_,§^+§,300,param4);
      }
      
      private function §>#o§(param1:§<!T§) : Number
      {
         switch(param1)
         {
            case §<!T§.§6"t§:
               return 0;
            default:
               return Math.random() * 2 * Math.PI;
         }
      }
   }
}


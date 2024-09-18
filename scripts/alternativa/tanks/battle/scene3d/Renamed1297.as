package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import flash.geom.Vector3D;
   import Renamed373.Renamed666;
   
   public class Renamed1297
   {
      private static const Renamed1298:Number = 85 * Math.PI / 180;
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const right:Vector3 = new Vector3();
      
      private static const up:Vector3 = new Vector3();
      
      private static const normal:Vector3 = new Vector3();
      
      private static const Renamed1300:Vector.<Vector3> = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3(),new Vector3(),new Vector3()]);
      
      private static const Renamed1301:Vector3D = new Vector3D();
      
      private static const Renamed1302:Vector3D = new Vector3D();
      
      private var collisionDetector:CollisionDetector;
      
      public function Renamed1297(param1:CollisionDetector)
      {
         super();
         this.collisionDetector = param1;
      }
      
      public function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:KDContainer, param6:Renamed1292) : Decal
      {
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         direction.diff(param1,param2);
         var _loc9_:Number = direction.length() + 200;
         direction.normalize();
         right.cross2(direction,Vector3.Z_AXIS).normalize();
         up.cross2(right,direction);
         Vector3(Renamed1300[4]).copy(param2);
         Vector3(Renamed1300[0]).copy(param2).addScaled(50,right);
         Vector3(Renamed1300[1]).copy(param2).addScaled(50,up);
         Vector3(Renamed1300[2]).copy(param2).addScaled(-50,right);
         Vector3(Renamed1300[3]).copy(param2).addScaled(-50,up);
         normal.reset(0,0,0);
         for each(_loc7_ in Renamed1300)
         {
            if(this.collisionDetector.raycastStatic(_loc7_,direction,Renamed666.Renamed690,_loc9_,null,Renamed1299))
            {
               normal.add(Renamed1299.normal);
            }
         }
         normal.normalize();
         Renamed668.Renamed684(param1,Renamed1301);
         Renamed668.Renamed684(normal,Renamed1302);
         _loc8_ = this.Renamed1303(param6);
         return param5.createDecal(Renamed1301,Renamed1302,param3,_loc8_,Renamed1298,300,param4);
      }
      
      private function Renamed1303(param1:Renamed1292) : Number
      {
         switch(param1)
         {
            case Renamed1292.Renamed1293:
               return 0;
            default:
               return Math.random() * 2 * Math.PI;
         }
      }
   }
}


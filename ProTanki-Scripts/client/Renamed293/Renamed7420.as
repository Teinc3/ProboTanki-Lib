package Renamed293
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1203;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.engine3d.TrackMaterial;
   import alternativa.tanks.materials.TrackMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   
   public class Renamed1228 implements Renamed1229
   {
      [Inject]
      public static var Renamed1233:TextureMaterialRegistry;
      
      [Inject]
      public static var Renamed4727:TankSkinTextureRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed1228()
      {
         super();
      }
      
      public function Renamed1253(param1:Renamed917, param2:IColoring) : Renamed1203
      {
         var _loc3_:MultiframeImageResource = null;
         var _loc4_:TextureMaterial = null;
         var _loc5_:TextureMaterial = null;
         var _loc6_:ImageResource = null;
         if(param2.isAnimated())
         {
            _loc3_ = param2.getAnimatedColoring();
            _loc4_ = Renamed1233.getAnimatedPaint(_loc3_,param1.Renamed996());
            _loc5_ = Renamed1233.getAnimatedPaint(_loc3_,param1.Renamed1057());
         }
         else
         {
            _loc6_ = param2.getColoring();
            _loc4_ = Renamed1233.getPaint(_loc6_,param1.Renamed996());
            _loc5_ = Renamed1233.getPaint(_loc6_,param1.Renamed1057());
         }
         var _loc7_:alternativa.tanks.materials.TrackMaterial = new alternativa.tanks.materials.TrackMaterial(param1.Renamed996().details);
         var _loc8_:alternativa.tanks.materials.TrackMaterial = new alternativa.tanks.materials.TrackMaterial(param1.Renamed996().details);
         var _loc9_:BitmapData = Renamed4727.getTexture(param1.Renamed1057(),_loc6_.data);
         Renamed1233.addMaterial(_loc7_);
         Renamed1233.addMaterial(_loc8_);
         return new Renamed1203(_loc4_,_loc5_,_loc7_,_loc8_,new alternativa.tanks.engine3d.TrackMaterial(_loc9_,true));
      }
      
      public function Renamed1254(param1:Renamed917, param2:ImageResource) : Renamed1203
      {
         var _loc3_:TextureMaterial = Renamed1233.getPaint(param2,param1.Renamed996());
         var _loc4_:TextureMaterial = Renamed1233.getPaint(param2,param1.Renamed1057());
         var _loc5_:BitmapData = Renamed4727.getTexture(param1.Renamed1057(),param2.data);
         return new Renamed1203(_loc3_,_loc4_,null,null,new alternativa.tanks.engine3d.TrackMaterial(_loc5_,true));
      }
   }
}


package §;$$§
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   import alternativa.tanks.battle.objects.tank.tankskin.§-l§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.engine3d.TrackMaterial;
   import alternativa.tanks.materials.TrackMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   
   public class §3?§ implements §try var static§
   {
      [Inject]
      public static var §false for package§:TextureMaterialRegistry;
      
      [Inject]
      public static var §var package true§:TankSkinTextureRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §3?§()
      {
         super();
      }
      
      public function §2"b§(param1:§false catch set§, param2:IColoring) : §-l§
      {
         var _loc3_:MultiframeImageResource = null;
         var _loc4_:TextureMaterial = null;
         var _loc5_:TextureMaterial = null;
         var _loc6_:ImageResource = null;
         if(param2.isAnimated())
         {
            _loc3_ = param2.getAnimatedColoring();
            _loc4_ = §false for package§.getAnimatedPaint(_loc3_,param1.§-w§());
            _loc5_ = §false for package§.getAnimatedPaint(_loc3_,param1.§4W§());
         }
         else
         {
            _loc6_ = param2.getColoring();
            _loc4_ = §false for package§.getPaint(_loc6_,param1.§-w§());
            _loc5_ = §false for package§.getPaint(_loc6_,param1.§4W§());
         }
         var _loc7_:alternativa.tanks.materials.TrackMaterial = new alternativa.tanks.materials.TrackMaterial(param1.§-w§().details);
         var _loc8_:alternativa.tanks.materials.TrackMaterial = new alternativa.tanks.materials.TrackMaterial(param1.§-w§().details);
         var _loc9_:BitmapData = §var package true§.getTexture(param1.§4W§(),_loc6_.data);
         §false for package§.addMaterial(_loc7_);
         §false for package§.addMaterial(_loc8_);
         return new §-l§(_loc4_,_loc5_,_loc7_,_loc8_,new alternativa.tanks.engine3d.TrackMaterial(_loc9_,true));
      }
      
      public function §class var static§(param1:§false catch set§, param2:ImageResource) : §-l§
      {
         var _loc3_:TextureMaterial = §false for package§.getPaint(param2,param1.§-w§());
         var _loc4_:TextureMaterial = §false for package§.getPaint(param2,param1.§4W§());
         var _loc5_:BitmapData = §var package true§.getTexture(param1.§4W§(),param2.data);
         return new §-l§(_loc3_,_loc4_,null,null,new alternativa.tanks.engine3d.TrackMaterial(_loc5_,true));
      }
   }
}


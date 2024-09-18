package Renamed50
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed5317.Renamed5318;
   import Renamed5317.Renamed5321;
   import Renamed5317.Renamed5319;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.engine3d.Renamed1650;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4656 extends Renamed5319 implements Renamed5318, Renamed9750
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed4656()
      {
         super();
      }
      
      private static function Renamed1669(param1:BitmapData, param2:BitmapFilter = null) : TextureMaterial
      {
         var _loc3_:BitmapData = param2 != null ? GraphicsUtils.createFilteredImage(param1,param2) : param1;
         var _loc4_:TextureMaterial;
         (_loc4_ = Renamed1368.getMaterial(_loc3_)).repeat = true;
         return _loc4_;
      }
      
      private static function Renamed9826(param1:Vector.<Renamed1650>) : Vector.<Renamed1650>
      {
         var _loc2_:Vector.<Renamed1650> = new Vector.<Renamed1650>();
         var _loc3_:int = int(param1.length - 1);
         while(_loc3_ >= 0)
         {
            _loc2_.push(param1[_loc3_]);
            _loc3_--;
         }
         return _loc2_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed5321 = getInitParam();
         var _loc3_:Renamed3254 = Renamed3254(object.adapt(Renamed3254));
         var _loc4_:Renamed9775 = new Renamed9775();
         var _loc5_:MultiframeImageResource = _loc2_.healingBall;
         var _loc6_:TextureMaterial = Renamed1669(_loc2_.healingBall.data);
         var _loc7_:TextureMaterial = Renamed1669(_loc2_.healingBall.data,_loc3_.createFilter("hss"));
         var _loc8_:TextureMaterial = Renamed1669(_loc2_.healingRay.data,_loc3_.createFilter("hs"));
         var _loc9_:TextureMaterial = Renamed1669(_loc2_.damagingBall.data,_loc3_.createFilter("dss"));
         var _loc10_:TextureMaterial = Renamed1669(_loc2_.damagingRay.data,_loc3_.createFilter("ds"));
         var _loc11_:Vector.<Renamed1650> = GraphicsUtils.getUVFramesFromTexture(_loc6_.texture,_loc5_.frameWidth,_loc5_.frameHeight,_loc5_.numFrames);
         var _loc12_:Vector.<Renamed1650> = Renamed9826(_loc11_);
         _loc4_.Renamed9776 = new Renamed843(_loc6_,_loc11_,_loc5_.fps);
         _loc4_.idleSound = _loc2_.idleSound.sound;
         _loc4_.Renamed9777 = new Renamed843(_loc7_,_loc11_,_loc5_.fps);
         _loc4_.Renamed9778 = new Renamed843(_loc7_,_loc12_,_loc5_.fps);
         _loc4_.Renamed9779 = _loc8_;
         _loc4_.Renamed9780 = _loc2_.healingSound.sound;
         _loc4_.Renamed9781 = new Renamed843(_loc9_,_loc12_,_loc5_.fps);
         _loc4_.Renamed9782 = new Renamed843(_loc9_,_loc11_,_loc5_.fps);
         _loc4_.Renamed9783 = _loc10_;
         _loc4_.Renamed9784 = _loc2_.damagingSound.sound;
         var _loc13_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc4_.Renamed9476 = _loc13_.Renamed3262("start");
         _loc4_.Renamed9477 = _loc13_.Renamed3262("loop");
         _loc4_.Renamed9785 = _loc13_.Renamed3262("friendStart");
         _loc4_.Renamed9786 = _loc13_.Renamed3262("friendLoop");
         _loc4_.Renamed9787 = _loc13_.Renamed3262("enemyStart");
         _loc4_.Renamed9788 = _loc13_.Renamed3262("enemyLoop");
         _loc4_.Renamed9789 = _loc13_.Renamed3262("friendBeam");
         _loc4_.Renamed9790 = _loc13_.Renamed3262("enemyBeam");
         param1.putParams(Renamed9775,_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed9775 = Renamed9775(param1.getParams(Renamed9775));
         Renamed1368.releaseMaterial(_loc2_.Renamed9776.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed9777.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed9779);
         Renamed1368.releaseMaterial(_loc2_.Renamed9781.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed9783);
      }
      
      public function Renamed9751(param1:ClientObject) : Renamed9752
      {
         return new Renamed9827(battleService,Renamed9775(param1.getParams(Renamed9775)));
      }
   }
}


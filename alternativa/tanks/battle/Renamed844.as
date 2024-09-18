package alternativa.tanks.battle
{
   import Renamed1.Renamed836;
   import Renamed1.Renamed837;
   import Renamed838.Renamed839;
   import Renamed838.Renamed840;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed844
   {
      private static const Renamed845:Number = 0.2;
      
      private static const Renamed846:Number = 1;
      
      private static const bias:Vector3 = new Vector3(100,0,0);
      
      private static const Renamed847:Vector3 = new Vector3();
      
      private static const Renamed848:Vector3 = new Vector3();
      
      private var battleService:BattleService;
      
      private var dustSize:Number = 0;
      
      private var animation:Renamed843;
      
      private var tanks:Dictionary;
      
      private var camera:Renamed842;
      
      private var nearDistance:Number;
      
      private var farDistance:Number;
      
      public var enabled:Boolean = true;
      
      private var intensity:Number;
      
      private var Renamed849:Number;
      
      public function Renamed844(param1:BattleService)
      {
         this.tanks = new Dictionary();
         super();
         this.battleService = param1;
         this.camera = param1.Renamed621().Renamed739();
      }
      
      private static function Renamed850(param1:Vector3, param2:Number) : void
      {
         param1.x += (Math.random() - 0.5) * 2 * param2;
         param1.y += (Math.random() - 0.5) * 2 * param2;
         param1.z += (Math.random() - 0.5) * 2 * param2;
      }
      
      public function init(param1:MultiframeImageResource, param2:TextureMaterialRegistry, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         this.animation = GraphicsUtils.getTextureAnimationFromResource(param2,param1);
         this.farDistance = param3;
         this.nearDistance = param4;
         this.dustSize = param5;
         this.intensity = param6;
         this.Renamed849 = param7;
      }
      
      public function Renamed851(param1:Tank) : void
      {
         this.tanks[param1] = param1.Renamed852() / 600;
      }
      
      public function Renamed853(param1:Tank) : void
      {
         delete this.tanks[param1];
      }
      
      public function update() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Tank = null;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            for(_loc1_ in this.tanks)
            {
               _loc2_ = _loc1_ as Tank;
               if(Boolean(_loc2_) && _loc2_.state == Renamed841.Renamed854)
               {
                  this.Renamed855(_loc2_,100,this.Renamed849);
               }
            }
         }
      }
      
      public function Renamed855(param1:Tank, param2:Number = 100, param3:Number = 0.2) : void
      {
         var _loc4_:Number = Number(this.tanks[param1]);
         var _loc5_:Renamed840 = param1.Renamed856();
         var _loc6_:Renamed840 = param1.Renamed857();
         if(_loc5_.Renamed858 * _loc6_.Renamed858 < 0)
         {
            param2 = 5;
         }
         var _loc7_:Matrix3 = param1.Renamed696().baseMatrix;
         bias.x *= -1;
         _loc7_.transformVector(bias,Renamed847);
         this.Renamed859(_loc5_,_loc4_,Renamed847,param2,param3);
         bias.x *= -1;
         _loc7_.transformVector(bias,Renamed847);
         this.Renamed859(_loc6_,_loc4_,Renamed847,param2,param3);
      }
      
      private function Renamed859(param1:Renamed840, param2:Number, param3:Vector3, param4:Number, param5:Number) : void
      {
         var _loc6_:Renamed839 = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         while(_loc9_ < param1.Renamed860)
         {
            _loc6_ = param1.Renamed861[_loc9_];
            if((_loc7_ = _loc6_.speed) > param4 && Math.random() < param5)
            {
               _loc8_ = _loc7_ > 500 ? Number(1) : Number(0.3 + _loc7_ / 712);
               Renamed848.copy(_loc6_.Renamed862());
               Renamed850(Renamed848,50);
               param3.z = 100;
               Renamed850(param3,20);
               this.Renamed863(param2,Renamed848,param3,_loc8_);
            }
            _loc9_++;
         }
      }
      
      private function Renamed863(param1:Number, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         var _loc5_:Renamed836 = null;
         var _loc6_:Renamed837 = null;
         var _loc7_:Number = NaN;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            _loc5_ = Renamed836(this.battleService.Renamed618().getObject(Renamed836));
            _loc5_.init(param2,param3,0.01);
            _loc6_ = Renamed837(this.battleService.Renamed618().getObject(Renamed837));
            _loc7_ = this.dustSize * param1 * (1 + Renamed846 * Math.random());
            _loc6_.init(_loc7_,_loc7_,this.animation,Math.random() * 2 * Math.PI,_loc5_,0.5,0.5,null,130,BlendMode.NORMAL,this.nearDistance,this.farDistance,this.intensity * param4 * this.camera.softTransparencyStrength,true);
            this.battleService.Renamed621().Renamed636(_loc6_);
         }
      }
   }
}


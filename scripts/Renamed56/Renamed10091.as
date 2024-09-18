package Renamed56
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed922;
   import alternativa.tanks.models.weapon.Renamed3065;
   import Renamed373.Renamed666;
   
   public class Renamed10088 implements Renamed990
   {
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const Renamed9796:Renamed922 = new Renamed922();
      
      private var effects:Renamed10078;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed10089:Renamed10079;
      
      private var Renamed3313:Renamed3065;
      
      public function Renamed10088(param1:Renamed3065, param2:Renamed10079, param3:Renamed10078)
      {
         super();
         this.Renamed3313 = param1;
         this.Renamed10089 = param2;
         this.effects = param3;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
      }
      
      public function destroy() : void
      {
         this.effects.Renamed3062();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.effects.Renamed3062();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.effects.Renamed3062();
      }
      
      public function reset() : void
      {
         this.effects.Renamed3062();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function Renamed4935() : void
      {
         this.effects.Renamed10083(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020(),this.Renamed10089.Renamed10081());
         this.Renamed3110.Renamed1059(Renamed9796);
         this.effects.Renamed5252(Renamed9796.Renamed693);
      }
      
      public function fire(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Body = null;
         var _loc8_:Vector3 = null;
         var _loc9_:Tank = null;
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
         var _loc10_:Vector3 = param1;
         if(param2 != null && param2.length > 0)
         {
            _loc4_ = new Vector3();
            _loc4_.diff(param3[param3.length - 1],Renamed3195.Renamed689).normalize();
            if(Vector3.isFiniteVector(_loc4_))
            {
               if(_loc10_ == null)
               {
                  _loc10_ = Renamed10058.Renamed10060(Renamed3195.Renamed689,_loc4_);
               }
               _loc5_ = 1;
               _loc6_ = 0;
               while(_loc6_ < param2.length)
               {
                  _loc7_ = param2[_loc6_];
                  if(_loc7_ != null && _loc7_.tank != null)
                  {
                     _loc8_ = param3[_loc6_];
                     if(Vector3.isFiniteVector(_loc8_))
                     {
                        _loc9_ = _loc7_.tank;
                        _loc9_.Renamed1029(_loc8_,_loc4_,this.Renamed3313.Renamed3067() * _loc5_);
                     }
                  }
                  _loc5_ *= this.Renamed10089.Renamed10082();
                  _loc6_++;
               }
            }
            this.effects.Renamed10086(Renamed3195.Renamed693,param3[param3.length - 1],param3,param2);
         }
         this.effects.Renamed10084(Renamed3195.Renamed693,_loc10_,Renamed3195.direction);
         if(param1 != null)
         {
            this.effects.Renamed10085(Renamed3195.Renamed689,param1);
            this.effects.Renamed10087(Renamed3195.Renamed693,param1,this.Renamed10090(Renamed3195.Renamed693,param1));
         }
      }
      
      private function Renamed10090(param1:Vector3, param2:Vector3) : Vector3
      {
         var _loc3_:Vector3 = param2.clone();
         _loc3_.subtract(param1).normalize();
         var _loc4_:Vector3 = param2.clone();
         _loc4_.subtract(_loc3_);
         var _loc5_:RayHit = new RayHit();
         if(this.Renamed3110.Renamed696().scene.collisionDetector.raycastStatic(_loc4_,_loc3_,Renamed666.Renamed690,100,null,_loc5_))
         {
            return _loc5_.normal;
         }
         _loc3_.reverse();
         return _loc3_;
      }
      
      public function Renamed4934() : void
      {
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
      }
   }
}


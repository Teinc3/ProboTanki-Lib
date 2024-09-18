package Renamed462
{
   import Renamed211.Renamed908;
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   
   public class Renamed9180 extends Renamed4724
   {
      private static const Renamed9205:int = 5;
      
      private var size:Number;
      
      private var speed:Number;
      
      private var top:Number;
      
      private var Renamed9208:Vector3;
      
      private var animation:Renamed843;
      
      private var container:Renamed908;
      
      public function Renamed9180(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         this.Renamed9208 = new Vector3();
         super(Renamed9194,param4,Renamed9205);
         this.size = param1;
         this.speed = param2;
         this.top = param3;
      }
      
      public function Renamed9183(param1:Renamed843) : void
      {
         this.animation = param1;
      }
      
      public function Renamed1418(param1:Renamed908) : void
      {
         this.container = param1;
      }
      
      public function Renamed9191(param1:Vector3) : void
      {
         this.Renamed9208.copy(param1);
      }
      
      override protected function Renamed9210(param1:Renamed9195) : void
      {
         var _loc2_:Renamed9194 = Renamed9194(param1);
         _loc2_.init(this.size,this.Renamed9208,Math.random() * Math.PI * 2,this.animation);
         this.container.addChild(_loc2_.sprite);
      }
      
      override protected function Renamed9211(param1:Renamed9195, param2:Number) : void
      {
         var _loc4_:Renamed1647 = null;
         var _loc3_:Renamed9194 = null;
         _loc3_ = Renamed9194(param1);
         _loc4_ = _loc3_.sprite;
         _loc4_.update(param2);
         _loc4_.z += this.speed * param2;
         var _loc5_:Number = 1 - Math.abs(this.top / 2 - (_loc4_.z - _loc3_.Renamed9198)) * 2 / this.top;
         _loc4_.alpha = _loc5_;
         _loc4_.rotation = _loc3_.rotation + _loc5_ * 0.3;
         if(_loc4_.z - _loc3_.Renamed9198 >= this.top)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function Renamed9212(param1:Renamed9195) : void
      {
         this.container.removeChild(Renamed9194(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.animation = null;
         this.container = null;
      }
   }
}


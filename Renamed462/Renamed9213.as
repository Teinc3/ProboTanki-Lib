package Renamed462
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   
   public class Renamed9200 extends Renamed4724
   {
      private static const Renamed9201:Number = 130;
      
      private static const Renamed1632:Number = 6;
      
      private static const Renamed9202:Number = 0.2;
      
      private static const Renamed9203:Number = 20;
      
      private static const Renamed9204:int = 0.1;
      
      private static const Renamed9205:int = 5;
      
      private static const Renamed9206:Number = 0.1;
      
      private static const Renamed9207:Vector3 = new Vector3();
      
      private var Renamed9208:Vector3;
      
      private var material:TextureMaterial;
      
      private var container:Renamed908;
      
      public function Renamed9200()
      {
         this.Renamed9208 = new Vector3();
         super(Renamed9209,Renamed9204,Renamed9205);
      }
      
      public function Renamed1179(param1:TextureMaterial) : void
      {
         this.material = param1;
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
         var _loc2_:Renamed9209 = Renamed9209(param1);
         var _loc3_:Number = Renamed9201 + Math.random() * Renamed9201 / 2;
         var _loc4_:Sprite3D = _loc2_.sprite;
         Renamed9207.x = Math.random() * 2 - 1;
         Renamed9207.y = -Math.random();
         Renamed9207.z = Math.random() * 2 - 1;
         Renamed9207.normalize();
         Renamed9207.scale(Renamed1632);
         _loc2_.init(_loc3_,this.Renamed9208,Renamed9207,this.material);
         this.container.addChild(_loc4_);
      }
      
      override protected function Renamed9211(param1:Renamed9195, param2:Number) : void
      {
         var _loc3_:Renamed9209 = Renamed9209(param1);
         var _loc4_:Sprite3D = _loc3_.sprite;
         var _loc5_:Vector3 = _loc3_.direction;
         _loc5_.z -= Renamed9203 * param2;
         _loc4_.x += _loc5_.x;
         _loc4_.y += _loc5_.y;
         _loc4_.z += _loc5_.z;
         _loc3_.time += param2;
         if(_loc3_.time > Renamed9202)
         {
            _loc3_.time = Renamed9202;
         }
         _loc4_.alpha = 1 - _loc3_.time / Renamed9202;
         var _loc6_:Number = 1 - _loc4_.alpha;
         if(_loc6_ < Renamed9206)
         {
            _loc6_ = Renamed9206;
         }
         _loc4_.scaleX = _loc6_;
         _loc4_.scaleY = _loc6_;
         _loc4_.scaleZ = _loc6_;
         if(_loc4_.alpha <= 0)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function Renamed9212(param1:Renamed9195) : void
      {
         this.container.removeChild(Renamed9209(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.material = null;
         this.container = null;
      }
   }
}


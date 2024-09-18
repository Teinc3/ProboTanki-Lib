package §with for class§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   
   public class §9"_§ extends §use set while§
   {
      private static const §dynamic const static§:Number = 130;
      
      private static const §`!o§:Number = 6;
      
      private static const §'!l§:Number = 0.2;
      
      private static const §1""§:Number = 20;
      
      private static const §`#h§:int = 0.1;
      
      private static const §[#7§:int = 5;
      
      private static const §+!C§:Number = 0.1;
      
      private static const §default var switch§:Vector3 = new Vector3();
      
      private var §class set case§:Vector3;
      
      private var material:TextureMaterial;
      
      private var container:§6!<§;
      
      public function §9"_§()
      {
         this.§class set case§ = new Vector3();
         super(§`i§,§`#h§,§[#7§);
      }
      
      public function §28§(param1:TextureMaterial) : void
      {
         this.material = param1;
      }
      
      public function §class const continue§(param1:§6!<§) : void
      {
         this.container = param1;
      }
      
      public function §;s§(param1:Vector3) : void
      {
         this.§class set case§.copy(param1);
      }
      
      override protected function §false var super§(param1:§`6§) : void
      {
         var _loc2_:§`i§ = §`i§(param1);
         var _loc3_:Number = §dynamic const static§ + Math.random() * §dynamic const static§ / 2;
         var _loc4_:Sprite3D = _loc2_.sprite;
         §default var switch§.x = Math.random() * 2 - 1;
         §default var switch§.y = -Math.random();
         §default var switch§.z = Math.random() * 2 - 1;
         §default var switch§.normalize();
         §default var switch§.scale(§`!o§);
         _loc2_.init(_loc3_,this.§class set case§,§default var switch§,this.material);
         this.container.addChild(_loc4_);
      }
      
      override protected function §""1§(param1:§`6§, param2:Number) : void
      {
         var _loc3_:§`i§ = §`i§(param1);
         var _loc4_:Sprite3D = _loc3_.sprite;
         var _loc5_:Vector3 = _loc3_.direction;
         _loc5_.z -= §1""§ * param2;
         _loc4_.x += _loc5_.x;
         _loc4_.y += _loc5_.y;
         _loc4_.z += _loc5_.z;
         _loc3_.time += param2;
         if(_loc3_.time > §'!l§)
         {
            _loc3_.time = §'!l§;
         }
         _loc4_.alpha = 1 - _loc3_.time / §'!l§;
         var _loc6_:Number = 1 - _loc4_.alpha;
         if(_loc6_ < §+!C§)
         {
            _loc6_ = §+!C§;
         }
         _loc4_.scaleX = _loc6_;
         _loc4_.scaleY = _loc6_;
         _loc4_.scaleZ = _loc6_;
         if(_loc4_.alpha <= 0)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function §false catch throw§(param1:§`6§) : void
      {
         this.container.removeChild(§`i§(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.material = null;
         this.container = null;
      }
   }
}


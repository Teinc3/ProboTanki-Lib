package §with for class§
{
   import §-!!§.§6!<§;
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   
   public class §native package super§ extends §use set while§
   {
      private static const §[#7§:int = 5;
      
      private var size:Number;
      
      private var speed:Number;
      
      private var top:Number;
      
      private var §class set case§:Vector3;
      
      private var animation:§throw const switch§;
      
      private var container:§6!<§;
      
      public function §native package super§(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         this.§class set case§ = new Vector3();
         super(§+!W§,param4,§[#7§);
         this.size = param1;
         this.speed = param2;
         this.top = param3;
      }
      
      public function §final for implements§(param1:§throw const switch§) : void
      {
         this.animation = param1;
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
         var _loc2_:§+!W§ = §+!W§(param1);
         _loc2_.init(this.size,this.§class set case§,Math.random() * Math.PI * 2,this.animation);
         this.container.addChild(_loc2_.sprite);
      }
      
      override protected function §""1§(param1:§`6§, param2:Number) : void
      {
         var _loc4_:§7J§ = null;
         var _loc3_:§+!W§ = null;
         _loc3_ = §+!W§(param1);
         _loc4_ = _loc3_.sprite;
         _loc4_.update(param2);
         _loc4_.z += this.speed * param2;
         var _loc5_:Number = 1 - Math.abs(this.top / 2 - (_loc4_.z - _loc3_.§default for for§)) * 2 / this.top;
         _loc4_.alpha = _loc5_;
         _loc4_.rotation = _loc3_.rotation + _loc5_ * 0.3;
         if(_loc4_.z - _loc3_.§default for for§ >= this.top)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function §false catch throw§(param1:§`6§) : void
      {
         this.container.removeChild(§+!W§(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.animation = null;
         this.container = null;
      }
   }
}


package §?#0§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.camera.§function const package§;
   import alternativa.tanks.camera.§package const continue§;
   
   public class §9#W§ extends §package const continue§ implements §function const package§
   {
      private static const §super in§:Matrix3 = new Matrix3();
      
      private static const § !N§:Matrix3 = new Matrix3();
      
      private static const vector:Vector3 = new Vector3();
      
      private var §-"#§:Object3D;
      
      private var §+"E§:Number = 0;
      
      private var §%#V§:Vector3;
      
      private var §1X§:Number;
      
      private var §`#6§:Number;
      
      private var §set catch use§:int;
      
      private var §with set return§:Number = 1;
      
      private var §["O§:Number = 1;
      
      private var §static include§:Number = 0;
      
      private var §]#^§:Number = 5;
      
      public function §9#W§(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         this.§%#V§ = new Vector3();
         super();
         this.§1X§ = param1;
         this.§`#6§ = param2;
         this.§with set return§ = param3;
         this.§]#^§ = param4;
      }
      
      public function set §implements§(param1:int) : void
      {
         if(this.§set catch use§ != param1)
         {
            this.§set catch use§ = param1;
            this.§static include§ = 0;
         }
      }
      
      public function §7!6§() : Boolean
      {
         return this.§+"E§ == this.§1X§ || this.§+"E§ == this.§`#6§;
      }
      
      public function §super extends§(param1:Vector3) : void
      {
         var _loc2_:§3!0§ = null;
         _loc2_ = §super package§();
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
         param1.z = _loc2_.z;
      }
      
      public function §var for const§(param1:Vector3) : void
      {
         var _loc2_:§3!0§ = §super package§();
         var _loc3_:Vector3 = _loc2_.§?R§;
         param1.copy(_loc3_);
      }
      
      public function get §+!N§() : Number
      {
         return this.§+"E§;
      }
      
      public function set §+!N§(param1:Number) : void
      {
         if(param1 > this.§1X§)
         {
            this.§+"E§ = this.§1X§;
         }
         else if(param1 < this.§`#6§)
         {
            this.§+"E§ = this.§`#6§;
         }
         else
         {
            this.§+"E§ = param1;
         }
      }
      
      public function §'#N§(param1:Object3D) : void
      {
         this.§-"#§ = param1;
      }
      
      public function §["'§(param1:Vector3) : void
      {
         this.§%#V§.copy(param1);
      }
      
      public function §if var throw§(param1:Number) : void
      {
         this.§["O§ = param1;
      }
      
      override public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = param2 / 1000;
         if(this.§set catch use§ != 0)
         {
            this.§static include§ += this.§]#^§ * _loc4_;
            _loc3_ = this.§with set return§ * this.§["O§;
            if(this.§static include§ > _loc3_)
            {
               this.§static include§ = _loc3_;
            }
            this.§+"E§ += this.§set catch use§ * this.§static include§ * _loc4_;
            if(this.§+"E§ > this.§1X§)
            {
               this.§+"E§ = this.§1X§;
            }
            else if(this.§+"E§ < this.§`#6§)
            {
               this.§+"E§ = this.§`#6§;
            }
         }
         §super in§.setRotationMatrix(this.§-"#§.rotationX,this.§-"#§.rotationY,this.§-"#§.rotationZ);
         § !N§.fromAxisAngle(Vector3.X_AXIS,this.§+"E§ - Math.PI / 2);
         § !N§.append(§super in§);
         § !N§.getEulerAngles(vector);
         var _loc5_:§3!0§;
         (_loc5_ = §super package§()).rotationX = vector.x;
         _loc5_.rotationY = vector.y;
         _loc5_.rotationZ = vector.z;
         §super in§.transformVector(this.§%#V§,vector);
         _loc5_.x = vector.x + this.§-"#§.x;
         _loc5_.y = vector.y + this.§-"#§.y;
         _loc5_.z = vector.z + this.§-"#§.z;
      }
      
      public function §#!D§(param1:Number) : void
      {
         §super package§().fov = param1;
      }
   }
}


package §case include§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§7J§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import §set break§.§try var finally§;
   
   public class §package for else§ extends §["D§ implements §finally const package§
   {
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §throw set native§:Matrix4 = new Matrix4();
      
      private static const §return use§:Vector3 = new Vector3();
      
      private static const §null var each§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const §for package function§:Vector3 = new Vector3();
      
      private static const §=!h§:Number = 0.1;
      
      private static const §break function§:Number = 100;
      
      private var container:§6!<§;
      
      private var §&!e§:§##0§;
      
      private var §with catch throw§:§7J§;
      
      private var §!#l§:§7J§;
      
      private var turret:Object3D;
      
      private var §>R§:Vector3;
      
      private var §extends catch false§:Object3D;
      
      private var §try package null§:Number = 0;
      
      private var show:Boolean;
      
      private var dead:Boolean;
      
      private var time:int;
      
      private var mode:§try var finally§;
      
      private var sfxData:§&!$§;
      
      private var hitPoint:Vector3;
      
      private var §?![§:Vector3;
      
      private var targetPoint:Vector3;
      
      private var §finally catch for§:Number;
      
      private var § F§:Boolean;
      
      private var isLocal:Boolean;
      
      public function §package for else§(param1:§1Q§)
      {
         this.§>R§ = new Vector3();
         this.hitPoint = new Vector3();
         this.§?![§ = new Vector3();
         this.targetPoint = new Vector3();
         super(param1);
         this.§&!e§ = new §##0§();
         this.§&!e§.init(§<#]§.§]#U§,100);
         this.§with catch throw§ = new §7J§(§<#]§.§case for dynamic§,§<#]§.§case for dynamic§);
         this.§!#l§ = new §7J§(§<#]§.§?"3§,§<#]§.§?"3§);
         this.§!#l§.originY = 0.5;
      }
      
      public function §]#@§(param1:§&!$§, param2:Object3D, param3:Vector3) : void
      {
         this.isLocal = true;
         this.init(param1,param2,param3);
      }
      
      public function §try var extends§(param1:§&!$§, param2:Object3D, param3:Vector3) : void
      {
         this.isLocal = false;
         this.init(param1,param2,param3);
      }
      
      public function §use catch null§(param1:§try var finally§, param2:Object3D = null, param3:Vector3 = null) : void
      {
         var _loc4_:Number = NaN;
         this.§ F§ = false;
         if(param2 != null)
         {
            if(this.§extends catch false§ == param2)
            {
               if(this.isLocal && this.targetPoint != null)
               {
                  this.§?![§.copy(this.targetPoint);
               }
               else
               {
                  this.§?![§.copy(this.hitPoint);
               }
               _loc4_ = this.§?![§.distanceToSquared(param3);
               if(_loc4_ > §break function§)
               {
                  this.§ F§ = true;
                  this.§finally catch for§ = 0;
               }
            }
            this.hitPoint.copy(param3);
         }
         if(this.mode != param1 || this.§extends catch false§ != param2)
         {
            this.§extends catch false§ = param2;
            this.mode = param1;
            switch(param1)
            {
               case §try var finally§.IDLE:
                  this.§,#Z§();
                  break;
               case §try var finally§.HEALING:
                  this.§throw set try§();
                  break;
               case §try var finally§.DAMAGING:
                  this.§94§();
            }
            this.§try package null§ = 0;
         }
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.show)
         {
            this.§try package null§ += §<#]§.§>-§ * param1 / 1000;
            if(this.§try package null§ > 1)
            {
               this.§try package null§ = 1;
            }
         }
         else
         {
            this.§try package null§ -= §<#]§.§>-§ * param1 / 1000;
            if(this.§try package null§ <= 0)
            {
               if(this.dead)
               {
                  return false;
               }
            }
         }
         this.updateVisibility();
         this.time += param1;
         var _loc3_:int = this.§%-§();
         if(this.mode == §try var finally§.DAMAGING || this.mode == §try var finally§.HEALING)
         {
            this.§false catch final§();
            this.§1#Y§(param2,param1,_loc3_);
         }
         return true;
      }
      
      private function init(param1:§&!$§, param2:Object3D, param3:Vector3) : void
      {
         this.sfxData = param1;
         this.turret = param2;
         this.§>R§.copy(param3);
         this.mode = §try var finally§.OFF;
         this.§try package null§ = 0;
         this.show = true;
         this.dead = false;
         this.time = 0;
         this.updateVisibility();
      }
      
      private function §false catch final§() : void
      {
         if(this.targetPoint == null)
         {
            this.targetPoint = new Vector3();
         }
         if(this.§ F§)
         {
            this.§`"]§();
         }
         else
         {
            this.targetPoint.copy(this.hitPoint);
         }
      }
      
      private function §%-§() : int
      {
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §with const false§.transformVector(this.§>R§,§null var each§);
         this.§with catch throw§.x = §null var each§.x;
         this.§with catch throw§.y = §null var each§.y;
         this.§with catch throw§.z = §null var each§.z;
         var _loc1_:int = this.§with catch throw§.§,"Q§() * this.time / 1000;
         this.§with catch throw§.§true const switch§(_loc1_);
         return _loc1_;
      }
      
      private function §`"]§() : void
      {
         this.§finally catch for§ += §=!h§;
         if(this.§finally catch for§ >= 1)
         {
            this.§finally catch for§ = 1;
            this.§ F§ = false;
         }
         Vector3.interpolate(this.§finally catch for§,this.§?![§,this.hitPoint,this.targetPoint);
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§&!e§);
         this.§&!e§.setMaterialToAllFaces(null);
         this.container.removeChild(this.§!#l§);
         this.§!#l§.clear();
         this.container.removeChild(this.§with catch throw§);
         this.§with catch throw§.clear();
         this.container = null;
         this.sfxData = null;
         this.turret = null;
         this.§extends catch false§ = null;
         this.targetPoint = null;
         recycle();
      }
      
      public function stop() : void
      {
         this.dead = true;
         this.show = false;
      }
      
      public function kill() : void
      {
         this.dead = true;
         this.show = false;
         this.§try package null§ = 0;
      }
      
      private function §1#Y§(param1:§3!0§, param2:int, param3:int) : void
      {
         this.§!#l§.§true const switch§(param3);
         §throw set native§.setMatrix(this.§extends catch false§.x,this.§extends catch false§.y,this.§extends catch false§.z,this.§extends catch false§.rotationX,this.§extends catch false§.rotationY,this.§extends catch false§.rotationZ);
         §throw set native§.transformVector(this.targetPoint,§return use§);
         direction.diff(§return use§,§null var each§);
         var _loc4_:Number = direction.length() - §<#]§.§>"z§;
         if(_loc4_ < 0)
         {
            _loc4_ = 10;
         }
         this.§&!e§.update(param2,_loc4_);
         direction.normalize();
         §return use§.x = §null var each§.x + _loc4_ * direction.x;
         §return use§.y = §null var each§.y + _loc4_ * direction.y;
         §return use§.z = §null var each§.z + _loc4_ * direction.z;
         this.§!#l§.x = §return use§.x;
         this.§!#l§.y = §return use§.y;
         this.§!#l§.z = §return use§.z;
         §for package function§.x = param1.x;
         §for package function§.y = param1.y;
         §for package function§.z = param1.z;
         §null catch while§.§native var static§(this.§&!e§,§null var each§,direction,§for package function§);
      }
      
      private function updateVisibility() : void
      {
         this.§&!e§.alpha = this.§try package null§;
         this.§with catch throw§.alpha = this.§try package null§;
         this.§!#l§.alpha = this.§try package null§;
         var _loc1_:Number = §<#]§.§+!C§ + (1 - §<#]§.§+!C§) * this.§try package null§;
         this.§&!e§.scaleX = _loc1_;
         this.§with catch throw§.scaleX = _loc1_;
         this.§with catch throw§.scaleY = _loc1_;
         this.§with catch throw§.scaleZ = _loc1_;
         this.§!#l§.scaleX = _loc1_;
         this.§!#l§.scaleY = _loc1_;
         this.§!#l§.scaleZ = _loc1_;
      }
      
      private function hide() : void
      {
         this.show = false;
      }
      
      private function §,#Z§() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.§&!e§);
            this.container.removeChild(this.§!#l§);
            this.container.addChild(this.§with catch throw§);
            this.§with catch throw§.§do var super§(this.sfxData.§try package final§);
            this.§with catch throw§.§true const switch§(0);
         }
      }
      
      private function §throw set try§() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.§with catch throw§);
            this.container.addChild(this.§&!e§);
            this.container.addChild(this.§!#l§);
            this.§&!e§.§28§(this.sfxData.§override var set§,1);
            this.§with catch throw§.§do var super§(this.sfxData.§9"r§);
            this.§with catch throw§.§true const switch§(0);
            this.§!#l§.§do var super§(this.sfxData.§2!d§);
            this.§!#l§.§true const switch§(0);
         }
      }
      
      private function §94§() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.§with catch throw§);
            this.container.addChild(this.§&!e§);
            this.container.addChild(this.§!#l§);
            this.§&!e§.§28§(this.sfxData.§68§,-1);
            this.§with catch throw§.§do var super§(this.sfxData.§false return§);
            this.§with catch throw§.§true const switch§(0);
            this.§!#l§.§do var super§(this.sfxData.§5"$§);
            this.§!#l§.§true const switch§(0);
         }
      }
   }
}


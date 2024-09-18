package §with for class§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §final const else§ extends §["D§ implements §finally const package§
   {
      private static const §var static§:Number = 90;
      
      private static const §,"<§:Number = 200;
      
      private static const §var var try§:Number = 60;
      
      private static const §implements var native§:Number = 0.15;
      
      private static const §^"1§:Number = 0.25;
      
      private static const §`#@§:Object3D = new Object3D();
      
      private static const §include set for§:Vector3 = new Vector3();
      
      private var dust:§native package super§;
      
      private var §break package set§:§9"_§;
      
      private var §true var var§:set;
      
      private var time:Number;
      
      public function §final const else§(param1:§1Q§)
      {
         this.dust = new §native package super§(§var static§,§,"<§,§var var try§,§implements var native§);
         this.§break package set§ = new §9"_§();
         super(param1);
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.§break package set§.§class const continue§(param1);
         this.§break package set§.start();
         this.dust.§class const continue§(param1);
         this.dust.start();
      }
      
      public function init(param1:set, param2:§null var§) : void
      {
         this.§true var var§ = param1;
         param1.§do package use§(§`#@§);
         this.dust.§final for implements§(param2.dustTexture);
         this.§break package set§.§28§(param2.crumbsTexture);
         this.time = 0;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         this.§true var var§.§'!g§(§`#@§,param2,param1);
         this.§use package break§();
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         if(this.time >= §^"1§)
         {
            this.dust.stop();
            this.§break package set§.stop();
         }
         var _loc4_:Boolean = this.dust.update(_loc3_);
         return Boolean(this.§break package set§.update(_loc3_) || _loc4_);
      }
      
      private function §use package break§() : void
      {
         §include set for§.x = §`#@§.x;
         §include set for§.y = §`#@§.y;
         §include set for§.z = §`#@§.z;
         this.dust.§;s§(§include set for§);
         this.§break package set§.§;s§(§include set for§);
      }
      
      public function destroy() : void
      {
         this.dust.clear();
         this.§break package set§.clear();
         this.§true var var§.destroy();
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.dust.stop();
         this.§break package set§.stop();
      }
   }
}


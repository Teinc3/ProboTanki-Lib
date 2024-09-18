package §class for§
{
   import §7"j§.§ "d§;
   import §7"j§.§ q§;
   import §7"j§.§;"L§;
   import §7"j§.§<"z§;
   import §7"j§.§do set case§;
   import §7"j§.§do set while§;
   import §7"j§.§else each§;
   import §7"j§.§extends super§;
   import §7"j§.§final var super§;
   import §7"j§.§finally const package§;
   import §7"j§.§implements for break§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import flash.geom.Vector3D;
   
   public class §^!4§ implements §7#c§, §do set while§, § q§
   {
      public static const §do try§:int = 300;
      
      public static const §>!T§:Number = 300;
      
      public static const §implements package with§:Number = 200;
      
      public static const §override var override§:Number = 30;
      
      private static const §case package switch§:Number = 50;
      
      private static const §5Z§:Number = 25;
      
      private static const §catch const const§:Number = 0.5;
      
      private static const §]"V§:Number = 1.5;
      
      private static const §<"j§:Number = 20;
      
      private static const §`"h§:int = 500;
      
      private static const §default catch var§:Number = 80;
      
      private static const §throw for static§:Number = 0.5;
      
      private static const §default set finally§:Number = 2;
      
      private static const §set var else§:Number = 100;
      
      private static const § -§:int = 2200;
      
      private static const §final import§:Number = 1;
      
      private static const §false for implements§:Vector3D = new Vector3D();
      
      private static const §+#V§:Vector3D = new Vector3D();
      
      private static const §switch var final§:Vector3 = new Vector3();
      
      private static const §>!k§:Vector3 = new Vector3();
      
      private static const §return package use§:Vector3 = new Vector3();
      
      private static const §%!1§:Vector3 = new Vector3();
      
      private static const v:Vector3 = new Vector3();
      
      private var sfxData:§return continue§;
      
      private var battleService:BattleService;
      
      private var §?#Y§:§'$§;
      
      private var §;-§:§while var if§;
      
      private var §7"o§:§do set case§;
      
      public function §^!4§(param1:§return continue§, param2:BattleService)
      {
         super();
         this.sfxData = param1;
         this.battleService = param2;
      }
      
      private static function §super for extends§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         param4.copy(param1).subtract(param2);
         var _loc5_:Number = param4.dot(param3);
         param4.copy(param2).addScaled(_loc5_,param3);
      }
      
      private static function §+9§(param1:Vector3D, param2:Vector3D, param3:§false catch set§) : RayIntersectionData
      {
         var _loc4_:RayIntersectionData = raycast(param3.§7!T§(),param1,param2);
         var _loc5_:RayIntersectionData = raycast(param3.§&K§(),param1,param2);
         if(_loc4_ == null)
         {
            return _loc5_;
         }
         if(_loc5_ == null)
         {
            return _loc4_;
         }
         if(_loc5_.time < _loc4_.time)
         {
            return _loc5_;
         }
         return _loc4_;
      }
      
      private static function raycast(param1:Object3D, param2:Vector3D, param3:Vector3D) : RayIntersectionData
      {
         var _loc4_:Vector3D = param1.globalToLocal(param2);
         var _loc5_:Vector3D = param3.clone();
         _loc5_.x += param1.x;
         _loc5_.y += param1.y;
         _loc5_.z += param1.z;
         var _loc6_:Vector3D = param1.globalToLocal(_loc5_);
         return param1.intersectRay(_loc4_,_loc6_);
      }
      
      private static function §>#o§(param1:Vector3) : Vector3
      {
         §%!1§.x = Math.atan2(param1.z,Math.sqrt(param1.x * param1.x + param1.y * param1.y)) - Math.PI / 2;
         §%!1§.y = 0;
         §%!1§.z = -Math.atan2(param1.x,param1.y);
         return §%!1§;
      }
      
      public function §8#%§(param1:Vector3, param2:Object3D, param3:int) : void
      {
         if(this.§?#Y§ != null)
         {
            this.§?#Y§.kill();
         }
         this.§?#Y§ = §'$§(this.battleService.§class while§().getObject(§'$§));
         this.§?#Y§.init(§do try§,§do try§,this.sfxData.§2!P§,param1,param2,0,this.§>!R§(param3),this);
         this.battleService.§7"0§(this.§?#Y§);
         this.§="a§(param1,param2,param3);
      }
      
      public function §="a§(param1:Vector3, param2:Object3D, param3:int) : void
      {
         if(this.§;-§ != null)
         {
            this.§;-§.kill();
         }
         this.§;-§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.battleService.§class while§().getObject(§extends super§));
         _loc4_.init(param2,param1);
         this.§;-§.§>X§(_loc4_,param3,this.sfxData.§+#I§);
         this.battleService.§7"0§(this.§;-§);
      }
      
      private function §>!R§(param1:int) : Number
      {
         return 1000 * this.sfxData.§2!P§.§catch catch catch§.length / param1;
      }
      
      public function §`#y§(param1:Vector3) : void
      {
         if(this.§7"o§ != null)
         {
            this.§7"o§.kill();
         }
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.sound,§final import§);
         this.§7"o§ = §do set case§.create(param1,_loc2_,0,0,this);
         this.battleService.§"#D§(this.§7"o§);
      }
      
      public function §each set for§(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:§'"G§ = null;
         var _loc5_:§extends const set§ = null;
         if(param2 == null)
         {
            param2 = §,"W§.§^#Y§(param1,param3);
         }
         v.diff(param2,param1);
         if(v.dot(param3) > 0)
         {
            _loc4_ = §'"G§(this.battleService.§class while§().getObject(§'"G§));
            _loc4_.init(param1,param2,this.sfxData.§dynamic implements§,§5Z§,§catch const const§,§]"V§,§<"j§,§`"h§);
            this.battleService.§7"0§(_loc4_);
            _loc5_ = §extends const set§(this.battleService.§class while§().getObject(§extends const set§));
            _loc5_.init(param1,param2,this.sfxData.§-$!§,§default catch var§,§throw for static§,§default set finally§,§set var else§,§ -§);
            this.battleService.§7"0§(_loc5_);
         }
         this.§break set break§(param1);
         this.§dynamic package use§(param1,param2);
      }
      
      private function §dynamic package use§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:set = set(this.battleService.§class while§().getObject(set));
         var _loc4_:set = set(this.battleService.§class while§().getObject(set));
         _loc3_.init(param1,0);
         _loc4_.init(param2,0);
         var _loc5_:§ "d§ = § "d§(this.battleService.§class while§().getObject(§ "d§));
         _loc5_.init(_loc3_,_loc4_,this.sfxData.§final var true§);
         this.battleService.§7"0§(_loc5_);
      }
      
      public function §break set break§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc3_:set = set(this.battleService.§class while§().getObject(set));
         _loc3_.init(param1,0);
         _loc2_.init(_loc3_,this.sfxData.§super default§);
         this.battleService.§7"0§(_loc2_);
      }
      
      public function §extends package while§(param1:Vector3, param2:Vector3) : void
      {
         if(param2 != null)
         {
            this.battleService.§3l§().addDecal(param2,param1,§case package switch§,this.sfxData.§5#W§);
         }
      }
      
      public function §while set use§() : void
      {
         if(this.§?#Y§ != null)
         {
            this.§?#Y§.kill();
            this.§?#Y§ = null;
         }
         if(this.§;-§ != null)
         {
            this.§;-§.kill();
            this.§;-§ = null;
         }
         if(this.§7"o§ != null)
         {
            this.§7"o§.kill();
            this.§7"o§ = null;
         }
      }
      
      public function §return finally§(param1:§finally const package§) : void
      {
         if(this.§?#Y§ == param1)
         {
            this.§?#Y§ = null;
         }
      }
      
      public function §dynamic var each§(param1:§final var super§) : void
      {
         if(this.§7"o§ == param1)
         {
            this.§7"o§ = null;
         }
      }
      
      public function §null var final§(param1:Vector3, param2:Vector3, param3:Vector.<Vector3>, param4:Vector.<Body>) : void
      {
         var _loc5_:Body = null;
         var _loc6_:Tank = null;
         var _loc7_:RayIntersectionData = null;
         var _loc8_:Object3D = null;
         var _loc9_:Vector3D = null;
         §false for implements§.x = param1.x;
         §false for implements§.y = param1.y;
         §false for implements§.z = param1.z;
         §+#V§.x = param2.x - param1.x;
         §+#V§.y = param2.y - param1.y;
         §+#V§.z = param2.z - param1.z;
         §return package use§.copy(param2).subtract(param1).normalize();
         var _loc10_:int = 0;
         while(_loc10_ < param4.length)
         {
            _loc5_ = param4[_loc10_];
            if(_loc5_ != null && _loc5_.tank != null)
            {
               _loc6_ = _loc5_.tank;
               _loc7_ = §+9§(§false for implements§,§+#V§,_loc6_.§in package default§());
               if(_loc7_ == null)
               {
                  §super for extends§(param3[_loc10_],param1,§return package use§,§switch var final§);
                  §>!k§.copy(§return package use§);
               }
               else
               {
                  _loc8_ = _loc7_.object;
                  §switch var final§.copyFromVector3D(_loc8_.localToGlobal(_loc7_.point));
                  _loc9_ = _loc8_.localToGlobal(_loc7_.face.normal);
                  §>!k§.x = _loc9_.x - _loc8_.x;
                  §>!k§.y = _loc9_.y - _loc8_.y;
                  §>!k§.z = _loc9_.z - _loc8_.z;
               }
               this.§9"t§(§switch var final§,§>!k§,§return package use§);
               this.§const var throw§(§switch var final§,§>!k§);
            }
            _loc10_++;
         }
      }
      
      private function §const var throw§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§;"L§ = §;"L§(this.battleService.§class while§().getObject(§;"L§));
         _loc4_.init(param1,param2,50);
         _loc3_.init(_loc4_,this.sfxData.§^]§);
         this.battleService.§7"0§(_loc3_);
      }
      
      private function §9"t§(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:§else each§ = §else each§(this.battleService.§class while§().getObject(§else each§));
         _loc4_.init(§>!T§,param1,§>#o§(param2),this.sfxData.§2#F§,1);
         this.battleService.§3l§().§7"0§(_loc4_);
         var _loc5_:§<"z§ = §<"z§(this.battleService.§class while§().getObject(§<"z§));
         var _loc6_:set = set(this.battleService.§class while§().getObject(set));
         _loc6_.init(param1,30);
         _loc5_.init(§implements package with§,§implements package with§,this.sfxData.§package const package§,0,_loc6_,0.5,0.5,null,0);
         this.battleService.§3l§().§7"0§(_loc5_);
         var _loc7_:§%?§ = §%?§(this.battleService.§class while§().getObject(§%?§));
         _loc7_.init(param1,param3,this.sfxData.§native const super§);
         this.battleService.§3l§().§7"0§(_loc7_);
      }
      
      public function §continue var import§(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         §return package use§.copy(param2).subtract(param1).normalize();
         this.§9"t§(param2,param3,§return package use§);
         this.§const var throw§(param2,param3);
      }
   }
}


package §while catch use§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.tankskin.§function else§;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §get for try§ extends §function else§ implements DataUnitValidator
   {
      private static const §throw for continue§:RegExp = /box.*/i;
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*)/i;
      
      public var §include var while§:Vector3;
      
      public var §false super§:Vector.<Vector3>;
      
      public var §if null§:Vector3;
      
      private var §for var super§:Vector.<Vector3Validator>;
      
      private var §each const final§:Vector.<§9!u§>;
      
      public var meshes:Vector.<Mesh>;
      
      public function §get for try§(param1:Tanks3DSResource)
      {
         this.meshes = new Vector.<Mesh>();
         super(param1);
         this.§extends var var§(param1);
         this.§include var while§ = §while var§(param1);
         this.§false super§ = this.§[!z§(param1);
         this.§if null§ = this.§continue catch false§(param1);
         this.§each const final§ = this.§catch var static§(param1);
         this.§true catch catch§();
      }
      
      private static function §while var§(param1:Tanks3DSResource) : Vector3
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = param1.getObjectsByName(/fmnt/i);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_[0];
            return new Vector3(_loc2_.x,_loc2_.y,_loc2_.z);
         }
         throw new Error();
      }
      
      private function §extends var var§(param1:Tanks3DSResource) : void
      {
         var _loc2_:Object3D = null;
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !EXCLUDED.test(_loc2_.name))
            {
               this.meshes.push(initMesh(Mesh(_loc2_)));
            }
         }
      }
      
      private function §catch var static§(param1:Tanks3DSResource) : Vector.<§9!u§>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Mesh = null;
         var _loc4_:Vector.<Object3D> = param1.getObjectsByName(§throw for continue§);
         var _loc5_:Vector.<§9!u§> = new Vector.<§9!u§>();
         if(_loc4_ != null && _loc4_.length != 0)
         {
            for each(_loc2_ in _loc4_)
            {
               _loc5_.push(new §9!u§(_loc2_));
            }
         }
         else
         {
            for each(_loc3_ in this.meshes)
            {
               _loc5_.push(new §9!u§(_loc3_));
            }
         }
         return _loc5_;
      }
      
      private function §[!z§(param1:Tanks3DSResource) : Vector.<Vector3>
      {
         var §for const break§:Tanks3DSResource = param1;
         var §false const get§:Object3D = null;
         var §#"C§:Tanks3DSResource = §for const break§;
         var §false super§:Vector.<Vector3> = new Vector.<Vector3>();
         var §`!y§:Vector.<Object3D> = §#"C§.getObjectsByName(/muzzle.*/);
         if(§`!y§ != null)
         {
            §`!y§.sort(function(param1:Object3D, param2:Object3D):Number
            {
               if(param1.name <= param2.name)
               {
                  return -1;
               }
               return 1;
            });
            for each(§false const get§ in §`!y§)
            {
               §false super§.push(new Vector3(§false const get§.x,§false const get§.y,§false const get§.z));
            }
            return §false super§;
         }
         throw new Error();
      }
      
      private function §continue catch false§(param1:Tanks3DSResource) : Vector3
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = param1.getObjectsByName(/laser/i);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_[0];
            return new Vector3(_loc2_.x,_loc2_.y,_loc2_.z);
         }
         return this.§false super§[0];
      }
      
      private function §true catch catch§() : void
      {
         this.§for var super§ = new Vector.<Vector3Validator>(this.§false super§.length);
         var _loc1_:int = 0;
         while(_loc1_ < this.§false super§.length)
         {
            this.§for var super§[_loc1_] = new Vector3Validator(this.§false super§[_loc1_]);
            _loc1_++;
         }
      }
      
      public function hasIncorrectData() : Boolean
      {
         var _loc1_:Vector3Validator = null;
         for each(_loc1_ in this.§for var super§)
         {
            if(!_loc1_.isValid())
            {
               return true;
            }
         }
         return false;
      }
      
      public function getType() : int
      {
         return DataValidatorType.MEMHACK_MUZZLE_POSITION;
      }
      
      public function §class catch function§() : Vector.<§9!u§>
      {
         return this.§each const final§;
      }
   }
}


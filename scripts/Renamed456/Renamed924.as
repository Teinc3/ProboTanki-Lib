package Renamed456
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1168;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed924 extends Renamed1168 implements DataUnitValidator
   {
      private static const Renamed9108:RegExp = /box.*/i;
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*)/i;
      
      public var Renamed1274:Vector3;
      
      public var Renamed1058:Vector.<Vector3>;
      
      public var Renamed1073:Vector3;
      
      private var Renamed9109:Vector.<Vector3Validator>;
      
      private var Renamed9110:Vector.<Renamed923>;
      
      public var meshes:Vector.<Mesh>;
      
      public function Renamed924(param1:Tanks3DSResource)
      {
         this.meshes = new Vector.<Mesh>();
         super(param1);
         this.Renamed9111(param1);
         this.Renamed1274 = Renamed9112(param1);
         this.Renamed1058 = this.Renamed9113(param1);
         this.Renamed1073 = this.Renamed9114(param1);
         this.Renamed9110 = this.Renamed9115(param1);
         this.Renamed9116();
      }
      
      private static function Renamed9112(param1:Tanks3DSResource) : Vector3
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
      
      private function Renamed9111(param1:Tanks3DSResource) : void
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
      
      private function Renamed9115(param1:Tanks3DSResource) : Vector.<Renamed923>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Mesh = null;
         var _loc4_:Vector.<Object3D> = param1.getObjectsByName(Renamed9108);
         var _loc5_:Vector.<Renamed923> = new Vector.<Renamed923>();
         if(_loc4_ != null && _loc4_.length != 0)
         {
            for each(_loc2_ in _loc4_)
            {
               _loc5_.push(new Renamed923(_loc2_));
            }
         }
         else
         {
            for each(_loc3_ in this.meshes)
            {
               _loc5_.push(new Renamed923(_loc3_));
            }
         }
         return _loc5_;
      }
      
      private function Renamed9113(param1:Tanks3DSResource) : Vector.<Vector3>
      {
         var Renamed3693:Tanks3DSResource = param1;
         var Renamed9117:Object3D = null;
         var Renamed9118:Tanks3DSResource = Renamed3693;
         var Renamed1058:Vector.<Vector3> = new Vector.<Vector3>();
         var Renamed3700:Vector.<Object3D> = Renamed9118.getObjectsByName(/muzzle.*/);
         if(Renamed3700 != null)
         {
            Renamed3700.sort(function(param1:Object3D, param2:Object3D):Number
            {
               if(param1.name <= param2.name)
               {
                  return -1;
               }
               return 1;
            });
            for each(Renamed9117 in Renamed3700)
            {
               Renamed1058.push(new Vector3(Renamed9117.x,Renamed9117.y,Renamed9117.z));
            }
            return Renamed1058;
         }
         throw new Error();
      }
      
      private function Renamed9114(param1:Tanks3DSResource) : Vector3
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = param1.getObjectsByName(/laser/i);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_[0];
            return new Vector3(_loc2_.x,_loc2_.y,_loc2_.z);
         }
         return this.Renamed1058[0];
      }
      
      private function Renamed9116() : void
      {
         this.Renamed9109 = new Vector.<Vector3Validator>(this.Renamed1058.length);
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed1058.length)
         {
            this.Renamed9109[_loc1_] = new Vector3Validator(this.Renamed1058[_loc1_]);
            _loc1_++;
         }
      }
      
      public function hasIncorrectData() : Boolean
      {
         var _loc1_:Vector3Validator = null;
         for each(_loc1_ in this.Renamed9109)
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
      
      public function Renamed1271() : Vector.<Renamed923>
      {
         return this.Renamed9110;
      }
   }
}


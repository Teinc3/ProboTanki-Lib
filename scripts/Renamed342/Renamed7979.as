package Renamed342
{
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.physics.collision.types.AABB;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.proplib.PropLibrary;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.proplib.types.PropData;
   import alternativa.proplib.types.PropGroup;
   import alternativa.tanks.battle.scene3d.Renamed1230;
   import alternativa.utils.clearDictionary;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class Renamed7979
   {
      private static const Renamed5707:Matrix3D = new Matrix3D();
      
      private static const Renamed8021:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D(1,1,1)]);
      
      private var Renamed7973:PropLibRegistry;
      
      private var Renamed8022:Renamed7941;
      
      private var objects:Vector.<Object3D>;
      
      private var Renamed8014:Vector.<Object3D>;
      
      private var occluders:Vector.<Occluder>;
      
      private var Renamed1367:Vector.<Mesh>;
      
      private var Renamed8023:Vector.<Object3D>;
      
      private var lights:Vector.<Light3D>;
      
      private var Renamed8024:Dictionary;
      
      private var Renamed8025:Dictionary;
      
      private var Renamed7977:AABB;
      
      private var Renamed8026:Renamed7963;
      
      private var Renamed8027:Object3D;
      
      private var Renamed8028:Vector.<Object3D>;
      
      public function Renamed7979(param1:PropLibRegistry)
      {
         this.lights = new Vector.<Light3D>();
         this.Renamed8022 = new Renamed7941();
         this.objects = new Vector.<Object3D>();
         this.Renamed8014 = new Vector.<Object3D>();
         this.occluders = new Vector.<Occluder>();
         this.Renamed1367 = new Vector.<Mesh>();
         this.Renamed8023 = new Vector.<Object3D>();
         this.Renamed8024 = new Dictionary();
         this.Renamed8025 = new Dictionary();
         this.Renamed7977 = new AABB();
         this.Renamed8026 = new Renamed7963();
         this.Renamed8028 = new Vector.<Object3D>();
         super();
         this.Renamed7973 = param1;
      }
      
      private static function Renamed8029(param1:XML) : String
      {
         var _loc2_:String = null;
         var _loc3_:XMLList = param1.elements("texture-name");
         if(_loc3_.length() > 0)
         {
            _loc2_ = _loc3_[0];
         }
         return _loc2_ || PropMesh.DEFAULT_TEXTURE;
      }
      
      private static function Renamed8030(param1:XMLList, param2:Vector3D) : void
      {
         var _loc3_:XML = null;
         if(param1.length() > 0)
         {
            _loc3_ = param1[0];
            param2.x = parseFloat(_loc3_.x);
            param2.y = parseFloat(_loc3_.y);
            param2.z = parseFloat(_loc3_.z);
         }
         else
         {
            param2.x = param2.y = param2.z = 0;
         }
      }
      
      public function parse(param1:XML) : void
      {
         this.Renamed8031(param1);
         this.Renamed8026.Renamed7965(this.Renamed8023);
         if(this.Renamed8027 != null)
         {
            (this.Renamed8027 as Mesh).calculateVerticesNormalsByAngle(Math.PI / 3,1);
         }
         this.Renamed8032();
      }
      
      private function Renamed8031(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc2_:XML = null;
         for each(_loc2_ in param1.elements("static-geometry").prop)
         {
            this.parseProp(_loc2_);
         }
         for each(_loc3_ in param1.elements("lights").light)
         {
            this.Renamed8033(_loc3_);
         }
      }
      
      private function parseProp(param1:XML) : void
      {
         var _loc2_:PropObject = this.Renamed8034(param1);
         if(_loc2_ != null)
         {
            if(_loc2_ is PropMesh)
            {
               this.Renamed8035(param1,PropMesh(_loc2_));
            }
            else if(_loc2_ is PropSprite)
            {
               this.Renamed8036(param1,PropSprite(_loc2_));
            }
         }
      }
      
      private function Renamed8033(param1:XML) : void
      {
         var _loc2_:Light3D = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Vector3D = null;
         var _loc8_:Vector3D = null;
         switch(String(param1.attribute("type")))
         {
            case "omni":
               _loc3_ = param1.attribute("attenuationBegin") * 100;
               _loc4_ = param1.attribute("attenuationEnd") * 100;
               _loc5_ = uint(param1.attribute("color"));
               _loc6_ = Number(param1.attribute("intensity"));
               _loc2_ = new OmniLight(_loc5_,_loc3_,_loc4_);
               _loc2_.intensity = _loc6_;
         }
         if(_loc2_ != null)
         {
            _loc7_ = Renamed8021[0];
            Renamed8030(param1.position,_loc7_);
            _loc8_ = Renamed8021[1];
            Renamed8030(param1.rotation,_loc8_);
            _loc2_.x = _loc7_.x;
            _loc2_.y = _loc7_.y;
            _loc2_.z = _loc7_.z;
            _loc2_.rotationZ = _loc8_.z;
            _loc2_.calculateBounds();
            this.lights.push(_loc2_);
         }
      }
      
      private function Renamed8034(param1:XML) : PropObject
      {
         var _loc2_:String = param1.attribute("library-name");
         var _loc3_:String = param1.attribute("group-name");
         var _loc4_:String = param1.@name;
         var _loc5_:PropLibrary = this.Renamed7973.getLibrary(_loc2_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:PropGroup = _loc5_.rootGroup.getGroupByName(_loc3_);
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:PropData = _loc6_.getPropByName(_loc4_);
         if(_loc7_ == null)
         {
            return null;
         }
         return _loc7_.getDefaultState().getDefaultObject();
      }
      
      private function Renamed8035(param1:XML, param2:PropMesh) : void
      {
         if(param1.@name == "Billboard")
         {
            this.Renamed8037(param1,param2);
         }
         else
         {
            this.Renamed8038(param1,param2);
         }
      }
      
      private function Renamed8037(param1:XML, param2:PropMesh) : void
      {
         var _loc3_:Mesh = null;
         _loc3_ = Mesh(param2.object.clone());
         _loc3_.calculateFacesNormals();
         _loc3_.calculateVerticesNormalsByAngle(0);
         _loc3_.sorting = Sorting.DYNAMIC_BSP;
         _loc3_.name = Renamed1230.Renamed690;
         this.Renamed1367.push(_loc3_);
         var _loc4_:String = Renamed8029(param1);
         this.Renamed8022.Renamed7950(param2,_loc4_,_loc3_,"display");
         var _loc5_:Vector3D = Renamed8021[0];
         Renamed8030(param1.position,_loc5_);
         this.Renamed7977.addPoint(_loc5_.x,_loc5_.y,_loc5_.z);
         var _loc6_:Vector3D = Renamed8021[1];
         Renamed8030(param1.rotation,_loc6_);
         _loc3_.x = _loc5_.x;
         _loc3_.y = _loc5_.y;
         _loc3_.z = _loc5_.z;
         _loc3_.rotationZ = _loc6_.z;
         this.objects.push(_loc3_);
      }
      
      private function Renamed8038(param1:XML, param2:PropMesh) : void
      {
         var _loc3_:Mesh = null;
         _loc3_ = Mesh(param2.object.clone());
         var _loc4_:Vector3D = Renamed8021[0];
         Renamed8030(param1.position,_loc4_);
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         this.Renamed7977.addPoint(_loc4_.x,_loc4_.y,_loc4_.z);
         var _loc5_:Vector3D = Renamed8021[1];
         Renamed8030(param1.rotation,_loc5_);
         _loc3_.rotationZ = _loc5_.z;
         var _loc6_:String = Renamed8029(param1);
         this.Renamed8023.push(_loc3_);
         this.Renamed8024[_loc3_] = param2;
         this.Renamed8025[_loc3_] = _loc6_;
         this.Renamed8039(param2,Renamed8021);
         if(param1.@name == "Elka")
         {
            this.Renamed8027 = _loc3_;
         }
      }
      
      private function Renamed8039(param1:PropMesh, param2:Vector.<Vector3D>) : void
      {
         var _loc3_:Occluder = null;
         var _loc4_:Matrix3D = null;
         var _loc5_:Occluder = null;
         if(param1.occluders != null)
         {
            Renamed5707.recompose(param2);
            for each(_loc3_ in param1.occluders)
            {
               _loc4_ = _loc3_.matrix;
               _loc4_.append(Renamed5707);
               (_loc5_ = Occluder(_loc3_.clone())).matrix = _loc4_;
               this.occluders.push(_loc5_);
            }
         }
      }
      
      private function Renamed8036(param1:XML, param2:PropSprite) : void
      {
         var _loc3_:Vector3D = null;
         var _loc4_:Sprite3D = Sprite3D(param2.object.clone());
         if(param1.@name.indexOf("Shar") >= 0)
         {
            this.Renamed8028.push(_loc4_);
            _loc3_ = Renamed8021[0];
            Renamed8030(param1.position,_loc3_);
            _loc4_.x = _loc3_.x;
            _loc4_.y = _loc3_.y;
            _loc4_.z = _loc3_.z;
            _loc4_.name = param1.@name;
            return;
         }
         _loc4_.shadowMapAlphaThreshold = 0;
         _loc4_.softAttenuation = 80;
         this.Renamed8014.push(_loc4_);
         var _loc5_:Vector3D = Renamed8021[0];
         Renamed8030(param1.position,_loc5_);
         _loc4_.x = _loc5_.x;
         _loc4_.y = _loc5_.y;
         _loc4_.z = _loc5_.z;
         _loc4_.width = param2.scale;
         this.Renamed8022.Renamed7953(param2,_loc4_);
      }
      
      private function Renamed8032() : void
      {
         var _loc1_:Object3D = null;
         var _loc2_:Mesh = null;
         var _loc3_:BSP = null;
         for each(_loc1_ in this.Renamed8023)
         {
            _loc2_ = _loc1_ as Mesh;
            _loc3_ = new BSP();
            _loc3_.name = Renamed1230.Renamed690;
            _loc3_.createTree(_loc2_,true);
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.z = _loc2_.z;
            _loc3_.rotationZ = _loc2_.rotationZ;
            this.Renamed8022.Renamed7945(this.Renamed8024[_loc2_],this.Renamed8025[_loc2_],_loc3_);
            this.objects.push(_loc3_);
            if(_loc2_ == this.Renamed8027)
            {
               this.Renamed8027 = _loc3_;
            }
         }
         this.Renamed8023.length = 0;
         clearDictionary(this.Renamed8024);
         clearDictionary(this.Renamed8025);
      }
      
      public function clear() : void
      {
         this.Renamed7973 = null;
         this.Renamed8022.clear();
         this.objects.length = 0;
         this.Renamed8014.length = 0;
         this.occluders.length = 0;
         this.Renamed1367.length = 0;
         this.lights.length = 0;
         this.Renamed8027 = null;
         this.Renamed8028.length = 0;
      }
      
      public function Renamed7996() : Vector.<Object3D>
      {
         return this.objects;
      }
      
      public function Renamed7999() : Vector.<Object3D>
      {
         return this.Renamed8014;
      }
      
      public function Renamed7998() : Vector.<Occluder>
      {
         return this.occluders;
      }
      
      public function Renamed8001() : Vector.<Mesh>
      {
         return this.Renamed1367;
      }
      
      public function Renamed8000() : Vector.<Light3D>
      {
         return this.lights;
      }
      
      public function Renamed7988() : Vector.<Renamed7939>
      {
         return this.Renamed8022.Renamed7956();
      }
      
      public function Renamed2506() : AABB
      {
         return this.Renamed7977;
      }
      
      public function Renamed7994() : Object3D
      {
         return this.Renamed8027;
      }
      
      public function Renamed7995() : Vector.<Object3D>
      {
         return this.Renamed8028;
      }
   }
}


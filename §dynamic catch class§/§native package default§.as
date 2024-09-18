package §dynamic catch class§
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
   import alternativa.tanks.battle.scene3d.§?!2§;
   import alternativa.utils.clearDictionary;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   public class §native package default§
   {
      private static const §super in§:Matrix3D = new Matrix3D();
      
      private static const §'I§:Vector.<Vector3D> = Vector.<Vector3D>([new Vector3D(),new Vector3D(),new Vector3D(1,1,1)]);
      
      private var § "I§:PropLibRegistry;
      
      private var §true const return§:§'0§;
      
      private var objects:Vector.<Object3D>;
      
      private var §extends switch§:Vector.<Object3D>;
      
      private var occluders:Vector.<Occluder>;
      
      private var §function var in§:Vector.<Mesh>;
      
      private var §=A§:Vector.<Object3D>;
      
      private var lights:Vector.<Light3D>;
      
      private var §8!w§:Dictionary;
      
      private var §"#&§:Dictionary;
      
      private var §switch catch function§:AABB;
      
      private var §use set break§:§5w§;
      
      private var §`n§:Object3D;
      
      private var §]",§:Vector.<Object3D>;
      
      public function §native package default§(param1:PropLibRegistry)
      {
         this.lights = new Vector.<Light3D>();
         this.§true const return§ = new §'0§();
         this.objects = new Vector.<Object3D>();
         this.§extends switch§ = new Vector.<Object3D>();
         this.occluders = new Vector.<Occluder>();
         this.§function var in§ = new Vector.<Mesh>();
         this.§=A§ = new Vector.<Object3D>();
         this.§8!w§ = new Dictionary();
         this.§"#&§ = new Dictionary();
         this.§switch catch function§ = new AABB();
         this.§use set break§ = new §5w§();
         this.§]",§ = new Vector.<Object3D>();
         super();
         this.§ "I§ = param1;
      }
      
      private static function §get for catch§(param1:XML) : String
      {
         var _loc2_:String = null;
         var _loc3_:XMLList = param1.elements("texture-name");
         if(_loc3_.length() > 0)
         {
            _loc2_ = _loc3_[0];
         }
         return _loc2_ || PropMesh.DEFAULT_TEXTURE;
      }
      
      private static function §1!9§(param1:XMLList, param2:Vector3D) : void
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
         this.§return catch const§(param1);
         this.§use set break§.§8#!§(this.§=A§);
         if(this.§`n§ != null)
         {
            (this.§`n§ as Mesh).calculateVerticesNormalsByAngle(Math.PI / 3,1);
         }
         this.§get package§();
      }
      
      private function §return catch const§(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc2_:XML = null;
         for each(_loc2_ in param1.elements("static-geometry").prop)
         {
            this.parseProp(_loc2_);
         }
         for each(_loc3_ in param1.elements("lights").light)
         {
            this.§package for static§(_loc3_);
         }
      }
      
      private function parseProp(param1:XML) : void
      {
         var _loc2_:PropObject = this.§try const super§(param1);
         if(_loc2_ != null)
         {
            if(_loc2_ is PropMesh)
            {
               this.§@!X§(param1,PropMesh(_loc2_));
            }
            else if(_loc2_ is PropSprite)
            {
               this.§'m§(param1,PropSprite(_loc2_));
            }
         }
      }
      
      private function §package for static§(param1:XML) : void
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
            _loc7_ = §'I§[0];
            §1!9§(param1.position,_loc7_);
            _loc8_ = §'I§[1];
            §1!9§(param1.rotation,_loc8_);
            _loc2_.x = _loc7_.x;
            _loc2_.y = _loc7_.y;
            _loc2_.z = _loc7_.z;
            _loc2_.rotationZ = _loc8_.z;
            _loc2_.calculateBounds();
            this.lights.push(_loc2_);
         }
      }
      
      private function §try const super§(param1:XML) : PropObject
      {
         var _loc2_:String = param1.attribute("library-name");
         var _loc3_:String = param1.attribute("group-name");
         var _loc4_:String = param1.@name;
         var _loc5_:PropLibrary = this.§ "I§.getLibrary(_loc2_);
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
      
      private function §@!X§(param1:XML, param2:PropMesh) : void
      {
         if(param1.@name == "Billboard")
         {
            this.§>c§(param1,param2);
         }
         else
         {
            this.§dynamic const§(param1,param2);
         }
      }
      
      private function §>c§(param1:XML, param2:PropMesh) : void
      {
         var _loc3_:Mesh = null;
         _loc3_ = Mesh(param2.object.clone());
         _loc3_.calculateFacesNormals();
         _loc3_.calculateVerticesNormalsByAngle(0);
         _loc3_.sorting = Sorting.DYNAMIC_BSP;
         _loc3_.name = §?!2§.§finally catch while§;
         this.§function var in§.push(_loc3_);
         var _loc4_:String = §get for catch§(param1);
         this.§true const return§.§^!g§(param2,_loc4_,_loc3_,"display");
         var _loc5_:Vector3D = §'I§[0];
         §1!9§(param1.position,_loc5_);
         this.§switch catch function§.addPoint(_loc5_.x,_loc5_.y,_loc5_.z);
         var _loc6_:Vector3D = §'I§[1];
         §1!9§(param1.rotation,_loc6_);
         _loc3_.x = _loc5_.x;
         _loc3_.y = _loc5_.y;
         _loc3_.z = _loc5_.z;
         _loc3_.rotationZ = _loc6_.z;
         this.objects.push(_loc3_);
      }
      
      private function §dynamic const§(param1:XML, param2:PropMesh) : void
      {
         var _loc3_:Mesh = null;
         _loc3_ = Mesh(param2.object.clone());
         var _loc4_:Vector3D = §'I§[0];
         §1!9§(param1.position,_loc4_);
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         this.§switch catch function§.addPoint(_loc4_.x,_loc4_.y,_loc4_.z);
         var _loc5_:Vector3D = §'I§[1];
         §1!9§(param1.rotation,_loc5_);
         _loc3_.rotationZ = _loc5_.z;
         var _loc6_:String = §get for catch§(param1);
         this.§=A§.push(_loc3_);
         this.§8!w§[_loc3_] = param2;
         this.§"#&§[_loc3_] = _loc6_;
         this.§%#L§(param2,§'I§);
         if(param1.@name == "Elka")
         {
            this.§`n§ = _loc3_;
         }
      }
      
      private function §%#L§(param1:PropMesh, param2:Vector.<Vector3D>) : void
      {
         var _loc3_:Occluder = null;
         var _loc4_:Matrix3D = null;
         var _loc5_:Occluder = null;
         if(param1.occluders != null)
         {
            §super in§.recompose(param2);
            for each(_loc3_ in param1.occluders)
            {
               _loc4_ = _loc3_.matrix;
               _loc4_.append(§super in§);
               (_loc5_ = Occluder(_loc3_.clone())).matrix = _loc4_;
               this.occluders.push(_loc5_);
            }
         }
      }
      
      private function §'m§(param1:XML, param2:PropSprite) : void
      {
         var _loc3_:Vector3D = null;
         var _loc4_:Sprite3D = Sprite3D(param2.object.clone());
         if(param1.@name.indexOf("Shar") >= 0)
         {
            this.§]",§.push(_loc4_);
            _loc3_ = §'I§[0];
            §1!9§(param1.position,_loc3_);
            _loc4_.x = _loc3_.x;
            _loc4_.y = _loc3_.y;
            _loc4_.z = _loc3_.z;
            _loc4_.name = param1.@name;
            return;
         }
         _loc4_.shadowMapAlphaThreshold = 0;
         _loc4_.softAttenuation = 80;
         this.§extends switch§.push(_loc4_);
         var _loc5_:Vector3D = §'I§[0];
         §1!9§(param1.position,_loc5_);
         _loc4_.x = _loc5_.x;
         _loc4_.y = _loc5_.y;
         _loc4_.z = _loc5_.z;
         _loc4_.width = param2.scale;
         this.§true const return§.§class for default§(param2,_loc4_);
      }
      
      private function §get package§() : void
      {
         var _loc1_:Object3D = null;
         var _loc2_:Mesh = null;
         var _loc3_:BSP = null;
         for each(_loc1_ in this.§=A§)
         {
            _loc2_ = _loc1_ as Mesh;
            _loc3_ = new BSP();
            _loc3_.name = §?!2§.§finally catch while§;
            _loc3_.createTree(_loc2_,true);
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.z = _loc2_.z;
            _loc3_.rotationZ = _loc2_.rotationZ;
            this.§true const return§.§include for extends§(this.§8!w§[_loc2_],this.§"#&§[_loc2_],_loc3_);
            this.objects.push(_loc3_);
            if(_loc2_ == this.§`n§)
            {
               this.§`n§ = _loc3_;
            }
         }
         this.§=A§.length = 0;
         clearDictionary(this.§8!w§);
         clearDictionary(this.§"#&§);
      }
      
      public function clear() : void
      {
         this.§ "I§ = null;
         this.§true const return§.clear();
         this.objects.length = 0;
         this.§extends switch§.length = 0;
         this.occluders.length = 0;
         this.§function var in§.length = 0;
         this.lights.length = 0;
         this.§`n§ = null;
         this.§]",§.length = 0;
      }
      
      public function § #§() : Vector.<Object3D>
      {
         return this.objects;
      }
      
      public function §9u§() : Vector.<Object3D>
      {
         return this.§extends switch§;
      }
      
      public function §package const try§() : Vector.<Occluder>
      {
         return this.occluders;
      }
      
      public function §super var use§() : Vector.<Mesh>
      {
         return this.§function var in§;
      }
      
      public function §'"!§() : Vector.<Light3D>
      {
         return this.lights;
      }
      
      public function §'1§() : Vector.<§#!5§>
      {
         return this.§true const return§.§^m§();
      }
      
      public function §native continue§() : AABB
      {
         return this.§switch catch function§;
      }
      
      public function §,!l§() : Object3D
      {
         return this.§`n§;
      }
      
      public function §0!e§() : Vector.<Object3D>
      {
         return this.§]",§;
      }
   }
}


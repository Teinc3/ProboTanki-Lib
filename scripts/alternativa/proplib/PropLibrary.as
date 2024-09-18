package alternativa.proplib
{
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.proplib.types.PropData;
   import alternativa.proplib.types.PropGroup;
   import alternativa.proplib.types.PropState;
   import alternativa.proplib.utils.ByteArrayMap;
   import alternativa.proplib.utils.TextureByteDataMap;
   import alternativa.utils.XMLUtils;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.utils.ByteArray;
   
   public class PropLibrary
   {
      public static const LIB_FILE_NAME:String = "library.xml";
      
      public static const IMG_FILE_NAME:String = "images.xml";
      
      private var _rootGroup:PropGroup;
      
      private var files:ByteArrayMap;
      
      private var imageMap:TextureByteDataMap;
      
      public function PropLibrary(param1:ByteArrayMap)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Parameter files is null");
         }
         this.files = param1;
         var _loc2_:ByteArray = param1.getValue(IMG_FILE_NAME);
         if(_loc2_ != null)
         {
            this.imageMap = this.parseImageMap(XML(_loc2_.toString()));
         }
         this._rootGroup = this.parseGroup(XML(param1.getValue(LIB_FILE_NAME).toString()));
      }
      
      public function get name() : String
      {
         return this._rootGroup == null ? null : this._rootGroup.name;
      }
      
      public function get rootGroup() : PropGroup
      {
         return this._rootGroup;
      }
      
      private function parseImageMap(param1:XML) : TextureByteDataMap
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:TextureByteDataMap = new TextureByteDataMap();
         for each(_loc2_ in param1.image)
         {
            _loc3_ = _loc2_.@name;
            _loc4_ = _loc2_.attribute("new-name").toString().toLowerCase();
            _loc5_ = XMLUtils.getAttributeAsString(_loc2_,"alpha",null);
            if(_loc5_ != null)
            {
               _loc5_ = _loc5_.toLowerCase();
            }
            _loc6_.putValue(_loc3_,new TextureByteData(this.files.getValue(_loc4_),this.files.getValue(_loc5_)));
         }
         return _loc6_;
      }
      
      private function parseGroup(param1:XML) : PropGroup
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:PropGroup = new PropGroup(XMLUtils.copyXMLString(param1.@name));
         for each(_loc2_ in param1.prop)
         {
            _loc4_.addProp(this.parseProp(_loc2_));
         }
         for each(_loc3_ in param1.elements("prop-group"))
         {
            _loc4_.addGroup(this.parseGroup(_loc3_));
         }
         return _loc4_;
      }
      
      private function parseProp(param1:XML) : PropData
      {
         var _loc2_:XML = null;
         var _loc3_:PropData = new PropData(XMLUtils.copyXMLString(param1.@name));
         var _loc4_:XMLList = param1.state;
         if(_loc4_.length() > 0)
         {
            for each(_loc2_ in _loc4_)
            {
               _loc3_.addState(XMLUtils.copyXMLString(_loc2_.@name),this.parseState(_loc2_));
            }
         }
         else
         {
            _loc3_.addState(PropState.DEFAULT_NAME,this.parseState(param1));
         }
         return _loc3_;
      }
      
      private function parseState(param1:XML) : PropState
      {
         var _loc2_:XML = null;
         var _loc3_:PropState = new PropState();
         var _loc4_:XMLList = param1.lod;
         if(_loc4_.length() > 0)
         {
            for each(_loc2_ in _loc4_)
            {
               _loc3_.addLOD(this.parsePropObject(_loc2_),Number(_loc2_.@distance));
            }
         }
         else
         {
            _loc3_.addLOD(this.parsePropObject(param1),0);
         }
         return _loc3_;
      }
      
      private function parsePropObject(param1:XML) : PropObject
      {
         if(param1.mesh.length() > 0)
         {
            return this.parsePropMesh(param1.mesh[0]);
         }
         if(param1.sprite.length() > 0)
         {
            return this.parsePropSprite(param1.sprite[0]);
         }
         throw new Error("Unknown prop type");
      }
      
      private function parsePropMesh(param1:XML) : PropMesh
      {
         var _loc2_:XML = null;
         var _loc3_:ByteArray = this.files.getValue(param1.@file.toString().toLowerCase());
         var _loc4_:Object = null;
         if(param1.texture.length() > 0)
         {
            _loc4_ = {};
            for each(_loc2_ in param1.texture)
            {
               _loc4_[XMLUtils.copyXMLString(_loc2_.@name)] = _loc2_.attribute("diffuse-map").toString().toLowerCase();
            }
         }
         var _loc5_:String = XMLUtils.getAttributeAsString(param1,"object",null);
         return new PropMesh(_loc3_,_loc5_,_loc4_,this.files,this.imageMap);
      }
      
      private function parsePropSprite(param1:XML) : PropSprite
      {
         var _loc2_:String = param1.@file.toString().toLowerCase();
         var _loc3_:TextureByteData = this.imageMap == null ? new TextureByteData(this.files.getValue(_loc2_)) : this.imageMap.getValue(_loc2_);
         var _loc4_:Number = XMLUtils.getAttributeAsNumber(param1,"origin-x",0.5);
         var _loc5_:Number = XMLUtils.getAttributeAsNumber(param1,"origin-y",0.5);
         var _loc6_:Number = XMLUtils.getAttributeAsNumber(param1,"scale",1);
         return new PropSprite(_loc3_,_loc4_,_loc5_,_loc6_);
      }
   }
}


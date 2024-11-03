package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   use namespace alternativa3d;
   
   public class Object3D implements IEventDispatcher
   {
      alternativa3d static const boundVertexList:Vertex = Vertex.alternativa3d::createList(8);
      
      alternativa3d static const tA:Object3D = new Object3D();
      
      alternativa3d static const tB:Object3D = new Object3D();
      
      private static const staticSphere:Vector3D = new Vector3D();
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var rotationX:Number = 0;
      
      public var rotationY:Number = 0;
      
      public var rotationZ:Number = 0;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var scaleZ:Number = 1;
      
      public var name:String;
      
      public var visible:Boolean = true;
      
      public var alpha:Number = 1;
      
      public var blendMode:String = "normal";
      
      public var colorTransform:ColorTransform = null;
      
      public var filters:Array = null;
      
      public var mouseEnabled:Boolean = true;
      
      public var doubleClickEnabled:Boolean = false;
      
      public var useHandCursor:Boolean = false;
      
      public var depthMapAlphaThreshold:Number = 1;
      
      public var shadowMapAlphaThreshold:Number = 1;
      
      public var softAttenuation:Number = 0;
      
      public var useShadowMap:Boolean = true;
      
      public var useLight:Boolean = true;
      
      public var boundMinX:Number = -1e+22;
      
      public var boundMinY:Number = -1e+22;
      
      public var boundMinZ:Number = -1e+22;
      
      public var boundMaxX:Number = 1e+22;
      
      public var boundMaxY:Number = 1e+22;
      
      public var boundMaxZ:Number = 1e+22;
      
      alternativa3d var ma:Number;
      
      alternativa3d var mb:Number;
      
      alternativa3d var mc:Number;
      
      alternativa3d var md:Number;
      
      alternativa3d var me:Number;
      
      alternativa3d var mf:Number;
      
      alternativa3d var mg:Number;
      
      alternativa3d var mh:Number;
      
      alternativa3d var mi:Number;
      
      alternativa3d var mj:Number;
      
      alternativa3d var mk:Number;
      
      alternativa3d var ml:Number;
      
      alternativa3d var ima:Number;
      
      alternativa3d var imb:Number;
      
      alternativa3d var imc:Number;
      
      alternativa3d var imd:Number;
      
      alternativa3d var ime:Number;
      
      alternativa3d var imf:Number;
      
      alternativa3d var img:Number;
      
      alternativa3d var imh:Number;
      
      alternativa3d var imi:Number;
      
      alternativa3d var imj:Number;
      
      alternativa3d var imk:Number;
      
      alternativa3d var iml:Number;
      
      alternativa3d var _parent:Object3DContainer;
      
      alternativa3d var next:Object3D;
      
      alternativa3d var culling:int = 0;
      
      alternativa3d var transformId:int = 0;
      
      alternativa3d var distance:Number;
      
      alternativa3d var concatenatedAlpha:Number = 1;
      
      alternativa3d var concatenatedBlendMode:String = "normal";
      
      alternativa3d var concatenatedColorTransform:ColorTransform = null;
      
      alternativa3d var bubbleListeners:Object;
      
      alternativa3d var captureListeners:Object;
      
      alternativa3d var useDepth:Boolean = false;
      
      alternativa3d var transformConst:Vector.<Number>;
      
      alternativa3d var colorConst:Vector.<Number>;
      
      public function Object3D()
      {
         this.alternativa3d::transformConst = new Vector.<Number>(12);
         this.alternativa3d::colorConst = Vector.<Number>([0,0,0,1,0,0,0,1]);
         super();
      }
      
      public function get matrix() : Matrix3D
      {
         alternativa3d::tA.alternativa3d::composeMatrixFromSource(this);
         return new Matrix3D(Vector.<Number>([alternativa3d::tA.alternativa3d::ma,alternativa3d::tA.alternativa3d::me,alternativa3d::tA.alternativa3d::mi,0,alternativa3d::tA.alternativa3d::mb,alternativa3d::tA.alternativa3d::mf,alternativa3d::tA.alternativa3d::mj,0,alternativa3d::tA.alternativa3d::mc,alternativa3d::tA.alternativa3d::mg,alternativa3d::tA.alternativa3d::mk,0,alternativa3d::tA.alternativa3d::md,alternativa3d::tA.alternativa3d::mh,alternativa3d::tA.alternativa3d::ml,1]));
      }
      
      public function set matrix(param1:Matrix3D) : void
      {
         var _loc2_:Vector.<Vector3D> = param1.decompose();
         var _loc3_:Vector3D = _loc2_[0];
         var _loc4_:Vector3D = _loc2_[1];
         var _loc5_:Vector3D = _loc2_[2];
         this.x = _loc3_.x;
         this.y = _loc3_.y;
         this.z = _loc3_.z;
         this.rotationX = _loc4_.x;
         this.rotationY = _loc4_.y;
         this.rotationZ = _loc4_.z;
         this.scaleX = _loc5_.x;
         this.scaleY = _loc5_.y;
         this.scaleZ = _loc5_.z;
      }
      
      public function get concatenatedMatrix() : Matrix3D
      {
         alternativa3d::tA.alternativa3d::composeMatrixFromSource(this);
         var _loc1_:Object3D = this;
         while(_loc1_.alternativa3d::_parent != null)
         {
            _loc1_ = _loc1_.alternativa3d::_parent;
            alternativa3d::tB.alternativa3d::composeMatrixFromSource(_loc1_);
            alternativa3d::tA.alternativa3d::appendMatrix(alternativa3d::tB);
         }
         return new Matrix3D(Vector.<Number>([alternativa3d::tA.alternativa3d::ma,alternativa3d::tA.alternativa3d::me,alternativa3d::tA.alternativa3d::mi,0,alternativa3d::tA.alternativa3d::mb,alternativa3d::tA.alternativa3d::mf,alternativa3d::tA.alternativa3d::mj,0,alternativa3d::tA.alternativa3d::mc,alternativa3d::tA.alternativa3d::mg,alternativa3d::tA.alternativa3d::mk,0,alternativa3d::tA.alternativa3d::md,alternativa3d::tA.alternativa3d::mh,alternativa3d::tA.alternativa3d::ml,1]));
      }
      
      public function localToGlobal(param1:Vector3D) : Vector3D
      {
         alternativa3d::tA.alternativa3d::composeMatrixFromSource(this);
         var _loc2_:Object3D = this;
         while(_loc2_.alternativa3d::_parent != null)
         {
            _loc2_ = _loc2_.alternativa3d::_parent;
            alternativa3d::tB.alternativa3d::composeMatrixFromSource(_loc2_);
            alternativa3d::tA.alternativa3d::appendMatrix(alternativa3d::tB);
         }
         var _loc3_:Vector3D = new Vector3D();
         _loc3_.x = alternativa3d::tA.alternativa3d::ma * param1.x + alternativa3d::tA.alternativa3d::mb * param1.y + alternativa3d::tA.alternativa3d::mc * param1.z + alternativa3d::tA.alternativa3d::md;
         _loc3_.y = alternativa3d::tA.alternativa3d::me * param1.x + alternativa3d::tA.alternativa3d::mf * param1.y + alternativa3d::tA.alternativa3d::mg * param1.z + alternativa3d::tA.alternativa3d::mh;
         _loc3_.z = alternativa3d::tA.alternativa3d::mi * param1.x + alternativa3d::tA.alternativa3d::mj * param1.y + alternativa3d::tA.alternativa3d::mk * param1.z + alternativa3d::tA.alternativa3d::ml;
         return _loc3_;
      }
      
      public function globalToLocal(param1:Vector3D) : Vector3D
      {
         alternativa3d::tA.alternativa3d::composeMatrixFromSource(this);
         var _loc2_:Object3D = this;
         while(_loc2_.alternativa3d::_parent != null)
         {
            _loc2_ = _loc2_.alternativa3d::_parent;
            alternativa3d::tB.alternativa3d::composeMatrixFromSource(_loc2_);
            alternativa3d::tA.alternativa3d::appendMatrix(alternativa3d::tB);
         }
         alternativa3d::tA.alternativa3d::invertMatrix();
         var _loc3_:Vector3D = new Vector3D();
         _loc3_.x = alternativa3d::tA.alternativa3d::ma * param1.x + alternativa3d::tA.alternativa3d::mb * param1.y + alternativa3d::tA.alternativa3d::mc * param1.z + alternativa3d::tA.alternativa3d::md;
         _loc3_.y = alternativa3d::tA.alternativa3d::me * param1.x + alternativa3d::tA.alternativa3d::mf * param1.y + alternativa3d::tA.alternativa3d::mg * param1.z + alternativa3d::tA.alternativa3d::mh;
         _loc3_.z = alternativa3d::tA.alternativa3d::mi * param1.x + alternativa3d::tA.alternativa3d::mj * param1.y + alternativa3d::tA.alternativa3d::mk * param1.z + alternativa3d::tA.alternativa3d::ml;
         return _loc3_;
      }
      
      public function get parent() : Object3DContainer
      {
         return this.alternativa3d::_parent;
      }
      
      alternativa3d function setParent(param1:Object3DContainer) : void
      {
         this.alternativa3d::_parent = param1;
      }
      
      public function calculateBounds() : void
      {
         this.boundMinX = 1e+22;
         this.boundMinY = 1e+22;
         this.boundMinZ = 1e+22;
         this.boundMaxX = -1e+22;
         this.boundMaxY = -1e+22;
         this.boundMaxZ = -1e+22;
         this.alternativa3d::updateBounds(this,null);
         if(this.boundMinX > this.boundMaxX)
         {
            this.boundMinX = -1e+22;
            this.boundMinY = -1e+22;
            this.boundMinZ = -1e+22;
            this.boundMaxX = 1e+22;
            this.boundMaxY = 1e+22;
            this.boundMaxZ = 1e+22;
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:Object = null;
         if(param2 == null)
         {
            throw new TypeError("Parameter listener must be non-null.");
         }
         if(param3)
         {
            if(this.alternativa3d::captureListeners == null)
            {
               this.alternativa3d::captureListeners = new Object();
            }
            _loc6_ = this.alternativa3d::captureListeners;
         }
         else
         {
            if(this.alternativa3d::bubbleListeners == null)
            {
               this.alternativa3d::bubbleListeners = new Object();
            }
            _loc6_ = this.alternativa3d::bubbleListeners;
         }
         var _loc7_:Vector.<Function> = _loc6_[param1];
         if(_loc7_ == null)
         {
            _loc7_ = new Vector.<Function>();
            _loc6_[param1] = _loc7_;
         }
         if(_loc7_.indexOf(param2) < 0)
         {
            _loc7_.push(param2);
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:Vector.<Function> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = undefined;
         if(param2 == null)
         {
            throw new TypeError("Parameter listener must be non-null.");
         }
         var _loc9_:Object = param3 ? this.alternativa3d::captureListeners : this.alternativa3d::bubbleListeners;
         if(_loc9_ != null)
         {
            _loc4_ = _loc9_[param1];
            if(_loc4_ != null)
            {
               _loc5_ = int(_loc4_.indexOf(param2));
               if(_loc5_ >= 0)
               {
                  _loc6_ = int(_loc4_.length);
                  _loc7_ = _loc5_ + 1;
                  while(_loc7_ < _loc6_)
                  {
                     _loc4_[_loc5_] = _loc4_[_loc7_];
                     _loc7_++;
                     _loc5_++;
                  }
                  if(_loc6_ > 1)
                  {
                     _loc4_.length = _loc6_ - 1;
                  }
                  else
                  {
                     delete _loc9_[param1];
                     for(_loc8_ in _loc9_)
                     {
                     }
                     if(!_loc8_)
                     {
                        if(_loc9_ == this.alternativa3d::captureListeners)
                        {
                           this.alternativa3d::captureListeners = null;
                        }
                        else
                        {
                           this.alternativa3d::bubbleListeners = null;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.alternativa3d::captureListeners != null && Boolean(this.alternativa3d::captureListeners[param1]) || this.alternativa3d::bubbleListeners != null && Boolean(this.alternativa3d::bubbleListeners[param1]);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         var _loc2_:Object3D = this;
         while(_loc2_ != null)
         {
            if(_loc2_.alternativa3d::captureListeners != null && _loc2_.alternativa3d::captureListeners[param1] || _loc2_.alternativa3d::bubbleListeners != null && _loc2_.alternativa3d::bubbleListeners[param1])
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::_parent;
         }
         return false;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Function> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Function> = null;
         if(param1 == null)
         {
            throw new TypeError("Parameter event must be non-null.");
         }
         if(param1 is MouseEvent3D)
         {
            MouseEvent3D(param1).alternativa3d::_target = this;
         }
         var _loc7_:Vector.<Object3D> = new Vector.<Object3D>();
         var _loc8_:int = 0;
         _loc2_ = this;
         while(_loc2_ != null)
         {
            _loc7_[_loc8_] = _loc2_;
            _loc8_++;
            _loc2_ = _loc2_.alternativa3d::_parent;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc2_ = _loc7_[_loc9_];
            if(param1 is MouseEvent3D)
            {
               MouseEvent3D(param1).alternativa3d::_currentTarget = _loc2_;
            }
            if(this.alternativa3d::bubbleListeners != null)
            {
               _loc3_ = this.alternativa3d::bubbleListeners[param1.type];
               if(_loc3_ != null)
               {
                  _loc5_ = int(_loc3_.length);
                  _loc6_ = new Vector.<Function>();
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_[_loc4_] = _loc3_[_loc4_];
                     _loc4_++;
                  }
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     (_loc6_[_loc4_] as Function).call(null,param1);
                     _loc4_++;
                  }
               }
            }
            if(!param1.bubbles)
            {
               break;
            }
            _loc9_++;
         }
         return true;
      }
      
      public function calculateResolution(param1:int, param2:int, param3:int = 1, param4:Matrix3D = null) : Number
      {
         return 1;
      }
      
      public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         return null;
      }
      
      alternativa3d function checkIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Dictionary) : Boolean
      {
         return false;
      }
      
      alternativa3d function boundCheckIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number) : Boolean
      {
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = param1 + param4 * param7;
         var _loc19_:Number = param2 + param5 * param7;
         var _loc20_:Number = param3 + param6 * param7;
         if(param1 >= param8 && param1 <= param11 && param2 >= param9 && param2 <= param12 && param3 >= param10 && param3 <= param13 || _loc18_ >= param8 && _loc18_ <= param11 && _loc19_ >= param9 && _loc19_ <= param12 && _loc20_ >= param10 && _loc20_ <= param13)
         {
            return true;
         }
         if(param1 < param8 && _loc18_ < param8 || param1 > param11 && _loc18_ > param11 || param2 < param9 && _loc19_ < param9 || param2 > param12 && _loc19_ > param12 || param3 < param10 && _loc20_ < param10 || param3 > param13 && _loc20_ > param13)
         {
            return false;
         }
         var _loc21_:Number = 0.000001;
         if(param4 > _loc21_)
         {
            _loc14_ = (param8 - param1) / param4;
            _loc15_ = (param11 - param1) / param4;
         }
         else if(param4 < -_loc21_)
         {
            _loc14_ = (param11 - param1) / param4;
            _loc15_ = (param8 - param1) / param4;
         }
         else
         {
            _loc14_ = 0;
            _loc15_ = param7;
         }
         if(param5 > _loc21_)
         {
            _loc16_ = (param9 - param2) / param5;
            _loc17_ = (param12 - param2) / param5;
         }
         else if(param5 < -_loc21_)
         {
            _loc16_ = (param12 - param2) / param5;
            _loc17_ = (param9 - param2) / param5;
         }
         else
         {
            _loc16_ = 0;
            _loc17_ = param7;
         }
         if(_loc16_ >= _loc15_ || _loc17_ <= _loc14_)
         {
            return false;
         }
         if(_loc16_ < _loc14_)
         {
            if(_loc17_ < _loc15_)
            {
               _loc15_ = _loc17_;
            }
         }
         else
         {
            _loc14_ = _loc16_;
            if(_loc17_ < _loc15_)
            {
               _loc15_ = _loc17_;
            }
         }
         if(param6 > _loc21_)
         {
            _loc16_ = (param10 - param3) / param6;
            _loc17_ = (param13 - param3) / param6;
         }
         else if(param6 < -_loc21_)
         {
            _loc16_ = (param13 - param3) / param6;
            _loc17_ = (param10 - param3) / param6;
         }
         else
         {
            _loc16_ = 0;
            _loc17_ = param7;
         }
         if(_loc16_ >= _loc15_ || _loc17_ <= _loc14_)
         {
            return false;
         }
         return true;
      }
      
      public function clone() : Object3D
      {
         var _loc1_:Object3D = new Object3D();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      protected function clonePropertiesFrom(param1:Object3D) : void
      {
         this.name = param1.name;
         this.visible = param1.visible;
         this.alpha = param1.alpha;
         this.blendMode = param1.blendMode;
         this.mouseEnabled = param1.mouseEnabled;
         this.doubleClickEnabled = param1.doubleClickEnabled;
         this.useHandCursor = param1.useHandCursor;
         this.depthMapAlphaThreshold = param1.depthMapAlphaThreshold;
         this.shadowMapAlphaThreshold = param1.shadowMapAlphaThreshold;
         this.softAttenuation = param1.softAttenuation;
         this.useShadowMap = param1.useShadowMap;
         this.useLight = param1.useLight;
         this.alternativa3d::transformId = param1.alternativa3d::transformId;
         this.alternativa3d::distance = param1.alternativa3d::distance;
         if(param1.colorTransform != null)
         {
            this.colorTransform = new ColorTransform();
            this.colorTransform.concat(param1.colorTransform);
         }
         if(param1.filters != null)
         {
            this.filters = new Array().concat(param1.filters);
         }
         this.x = param1.x;
         this.y = param1.y;
         this.z = param1.z;
         this.rotationX = param1.rotationX;
         this.rotationY = param1.rotationY;
         this.rotationZ = param1.rotationZ;
         this.scaleX = param1.scaleX;
         this.scaleY = param1.scaleY;
         this.scaleZ = param1.scaleZ;
         this.boundMinX = param1.boundMinX;
         this.boundMinY = param1.boundMinY;
         this.boundMinZ = param1.boundMinZ;
         this.boundMaxX = param1.boundMaxX;
         this.boundMaxY = param1.boundMaxY;
         this.boundMaxZ = param1.boundMaxZ;
      }
      
      public function toString() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         return "[" + _loc1_.substr(_loc1_.indexOf("::") + 2) + " " + this.name + "]";
      }
      
      alternativa3d function draw(param1:Camera3D) : void
      {
      }
      
      alternativa3d function getVG(param1:Camera3D) : VG
      {
         return null;
      }
      
      alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
      }
      
      alternativa3d function concat(param1:Object3DContainer) : void
      {
         this.alternativa3d::concatenatedAlpha = param1.alternativa3d::concatenatedAlpha * this.alpha;
         this.alternativa3d::concatenatedBlendMode = param1.alternativa3d::concatenatedBlendMode != "normal" ? param1.alternativa3d::concatenatedBlendMode : this.blendMode;
         if(param1.alternativa3d::concatenatedColorTransform != null)
         {
            if(this.colorTransform != null)
            {
               this.alternativa3d::concatenatedColorTransform = new ColorTransform();
               this.alternativa3d::concatenatedColorTransform.redMultiplier = param1.alternativa3d::concatenatedColorTransform.redMultiplier;
               this.alternativa3d::concatenatedColorTransform.greenMultiplier = param1.alternativa3d::concatenatedColorTransform.greenMultiplier;
               this.alternativa3d::concatenatedColorTransform.blueMultiplier = param1.alternativa3d::concatenatedColorTransform.blueMultiplier;
               this.alternativa3d::concatenatedColorTransform.redOffset = param1.alternativa3d::concatenatedColorTransform.redOffset;
               this.alternativa3d::concatenatedColorTransform.greenOffset = param1.alternativa3d::concatenatedColorTransform.greenOffset;
               this.alternativa3d::concatenatedColorTransform.blueOffset = param1.alternativa3d::concatenatedColorTransform.blueOffset;
               this.alternativa3d::concatenatedColorTransform.concat(this.colorTransform);
            }
            else
            {
               this.alternativa3d::concatenatedColorTransform = param1.alternativa3d::concatenatedColorTransform;
            }
         }
         else
         {
            this.alternativa3d::concatenatedColorTransform = this.colorTransform;
         }
         if(this.alternativa3d::concatenatedColorTransform != null)
         {
            this.alternativa3d::colorConst[0] = this.alternativa3d::concatenatedColorTransform.redMultiplier;
            this.alternativa3d::colorConst[1] = this.alternativa3d::concatenatedColorTransform.greenMultiplier;
            this.alternativa3d::colorConst[2] = this.alternativa3d::concatenatedColorTransform.blueMultiplier;
            this.alternativa3d::colorConst[3] = this.alternativa3d::concatenatedAlpha;
            this.alternativa3d::colorConst[4] = this.alternativa3d::concatenatedColorTransform.redOffset / 255;
            this.alternativa3d::colorConst[5] = this.alternativa3d::concatenatedColorTransform.greenOffset / 255;
            this.alternativa3d::colorConst[6] = this.alternativa3d::concatenatedColorTransform.blueOffset / 255;
         }
         else
         {
            this.alternativa3d::colorConst[3] = this.alternativa3d::concatenatedAlpha;
         }
      }
      
      alternativa3d function boundIntersectRay(param1:Vector3D, param2:Vector3D, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         if(param1.x >= param3 && param1.x <= param6 && param1.y >= param4 && param1.y <= param7 && param1.z >= param5 && param1.z <= param8)
         {
            return true;
         }
         if(param1.x < param3 && param2.x <= 0 || param1.x > param6 && param2.x >= 0 || param1.y < param4 && param2.y <= 0 || param1.y > param7 && param2.y >= 0 || param1.z < param5 && param2.z <= 0 || param1.z > param8 && param2.z >= 0)
         {
            return false;
         }
         var _loc13_:Number = 0.000001;
         if(param2.x > _loc13_)
         {
            _loc9_ = (param3 - param1.x) / param2.x;
            _loc10_ = (param6 - param1.x) / param2.x;
         }
         else if(param2.x < -_loc13_)
         {
            _loc9_ = (param6 - param1.x) / param2.x;
            _loc10_ = (param3 - param1.x) / param2.x;
         }
         else
         {
            _loc9_ = 0;
            _loc10_ = 1e+22;
         }
         if(param2.y > _loc13_)
         {
            _loc11_ = (param4 - param1.y) / param2.y;
            _loc12_ = (param7 - param1.y) / param2.y;
         }
         else if(param2.y < -_loc13_)
         {
            _loc11_ = (param7 - param1.y) / param2.y;
            _loc12_ = (param4 - param1.y) / param2.y;
         }
         else
         {
            _loc11_ = 0;
            _loc12_ = 1e+22;
         }
         if(_loc11_ >= _loc10_ || _loc12_ <= _loc9_)
         {
            return false;
         }
         if(_loc11_ < _loc9_)
         {
            if(_loc12_ < _loc10_)
            {
               _loc10_ = _loc12_;
            }
         }
         else
         {
            _loc9_ = _loc11_;
            if(_loc12_ < _loc10_)
            {
               _loc10_ = _loc12_;
            }
         }
         if(param2.z > _loc13_)
         {
            _loc11_ = (param5 - param1.z) / param2.z;
            _loc12_ = (param8 - param1.z) / param2.z;
         }
         else if(param2.z < -_loc13_)
         {
            _loc11_ = (param8 - param1.z) / param2.z;
            _loc12_ = (param5 - param1.z) / param2.z;
         }
         else
         {
            _loc11_ = 0;
            _loc12_ = 1e+22;
         }
         if(_loc11_ >= _loc10_ || _loc12_ <= _loc9_)
         {
            return false;
         }
         return true;
      }
      
      alternativa3d function collectPlanes(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector.<Face>, param7:Dictionary = null) : void
      {
      }
      
      alternativa3d function calculateSphere(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector3D = null) : Vector3D
      {
         this.alternativa3d::calculateInverseMatrix();
         var _loc7_:Number = this.alternativa3d::ima * param1.x + this.alternativa3d::imb * param1.y + this.alternativa3d::imc * param1.z + this.alternativa3d::imd;
         var _loc8_:Number = this.alternativa3d::ime * param1.x + this.alternativa3d::imf * param1.y + this.alternativa3d::img * param1.z + this.alternativa3d::imh;
         var _loc9_:Number = this.alternativa3d::imi * param1.x + this.alternativa3d::imj * param1.y + this.alternativa3d::imk * param1.z + this.alternativa3d::iml;
         var _loc10_:Number = this.alternativa3d::ima * param2.x + this.alternativa3d::imb * param2.y + this.alternativa3d::imc * param2.z + this.alternativa3d::imd;
         var _loc11_:Number = this.alternativa3d::ime * param2.x + this.alternativa3d::imf * param2.y + this.alternativa3d::img * param2.z + this.alternativa3d::imh;
         var _loc12_:Number = this.alternativa3d::imi * param2.x + this.alternativa3d::imj * param2.y + this.alternativa3d::imk * param2.z + this.alternativa3d::iml;
         var _loc13_:Number = this.alternativa3d::ima * param3.x + this.alternativa3d::imb * param3.y + this.alternativa3d::imc * param3.z + this.alternativa3d::imd;
         var _loc14_:Number = this.alternativa3d::ime * param3.x + this.alternativa3d::imf * param3.y + this.alternativa3d::img * param3.z + this.alternativa3d::imh;
         var _loc15_:Number = this.alternativa3d::imi * param3.x + this.alternativa3d::imj * param3.y + this.alternativa3d::imk * param3.z + this.alternativa3d::iml;
         var _loc16_:Number = this.alternativa3d::ima * param4.x + this.alternativa3d::imb * param4.y + this.alternativa3d::imc * param4.z + this.alternativa3d::imd;
         var _loc17_:Number = this.alternativa3d::ime * param4.x + this.alternativa3d::imf * param4.y + this.alternativa3d::img * param4.z + this.alternativa3d::imh;
         var _loc18_:Number = this.alternativa3d::imi * param4.x + this.alternativa3d::imj * param4.y + this.alternativa3d::imk * param4.z + this.alternativa3d::iml;
         var _loc19_:Number = this.alternativa3d::ima * param5.x + this.alternativa3d::imb * param5.y + this.alternativa3d::imc * param5.z + this.alternativa3d::imd;
         var _loc20_:Number = this.alternativa3d::ime * param5.x + this.alternativa3d::imf * param5.y + this.alternativa3d::img * param5.z + this.alternativa3d::imh;
         var _loc21_:Number = this.alternativa3d::imi * param5.x + this.alternativa3d::imj * param5.y + this.alternativa3d::imk * param5.z + this.alternativa3d::iml;
         var _loc22_:Number = _loc10_ - _loc7_;
         var _loc23_:Number = _loc11_ - _loc8_;
         var _loc24_:Number = _loc12_ - _loc9_;
         var _loc25_:Number = _loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_;
         _loc22_ = _loc13_ - _loc7_;
         _loc23_ = _loc14_ - _loc8_;
         _loc24_ = _loc15_ - _loc9_;
         var _loc26_:Number = _loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_;
         if(_loc26_ > _loc25_)
         {
            _loc25_ = _loc26_;
         }
         _loc22_ = _loc16_ - _loc7_;
         _loc23_ = _loc17_ - _loc8_;
         _loc24_ = _loc18_ - _loc9_;
         _loc26_ = _loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_;
         if(_loc26_ > _loc25_)
         {
            _loc25_ = _loc26_;
         }
         _loc22_ = _loc19_ - _loc7_;
         _loc23_ = _loc20_ - _loc8_;
         _loc24_ = _loc21_ - _loc9_;
         _loc26_ = _loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_;
         if(_loc26_ > _loc25_)
         {
            _loc25_ = _loc26_;
         }
         if(param6 == null)
         {
            param6 = staticSphere;
         }
         param6.x = _loc7_;
         param6.y = _loc8_;
         param6.z = _loc9_;
         param6.w = Math.sqrt(_loc25_);
         return param6;
      }
      
      alternativa3d function boundIntersectSphere(param1:Vector3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Boolean
      {
         return param1.x + param1.w > param2 && param1.x - param1.w < param5 && param1.y + param1.w > param3 && param1.y - param1.w < param6 && param1.z + param1.w > param4 && param1.z - param1.w < param7;
      }
      
      alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         return new Vector.<Object3D>(2);
      }
      
      alternativa3d function testSplit(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : int
      {
         var _loc5_:Vector3D = this.alternativa3d::calculatePlane(param1,param2,param3);
         if(_loc5_.x >= 0)
         {
            if(_loc5_.y >= 0)
            {
               if(_loc5_.z >= 0)
               {
                  if(this.boundMaxX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMaxZ * _loc5_.z <= _loc5_.w + param4)
                  {
                     return -1;
                  }
                  if(this.boundMinX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMinZ * _loc5_.z >= _loc5_.w - param4)
                  {
                     return 1;
                  }
               }
               else
               {
                  if(this.boundMaxX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMinZ * _loc5_.z <= _loc5_.w + param4)
                  {
                     return -1;
                  }
                  if(this.boundMinX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMaxZ * _loc5_.z >= _loc5_.w - param4)
                  {
                     return 1;
                  }
               }
            }
            else if(_loc5_.z >= 0)
            {
               if(this.boundMaxX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMaxZ * _loc5_.z <= _loc5_.w + param4)
               {
                  return -1;
               }
               if(this.boundMinX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMinZ * _loc5_.z >= _loc5_.w - param4)
               {
                  return 1;
               }
            }
            else
            {
               if(this.boundMaxX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMinZ * _loc5_.z <= _loc5_.w + param4)
               {
                  return -1;
               }
               if(this.boundMinX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMaxZ * _loc5_.z >= _loc5_.w - param4)
               {
                  return 1;
               }
            }
         }
         else if(_loc5_.y >= 0)
         {
            if(_loc5_.z >= 0)
            {
               if(this.boundMinX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMaxZ * _loc5_.z <= _loc5_.w + param4)
               {
                  return -1;
               }
               if(this.boundMaxX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMinZ * _loc5_.z >= _loc5_.w - param4)
               {
                  return 1;
               }
            }
            else
            {
               if(this.boundMinX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMinZ * _loc5_.z <= _loc5_.w + param4)
               {
                  return -1;
               }
               if(this.boundMaxX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMaxZ * _loc5_.z >= _loc5_.w - param4)
               {
                  return 1;
               }
            }
         }
         else if(_loc5_.z >= 0)
         {
            if(this.boundMinX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMaxZ * _loc5_.z <= _loc5_.w + param4)
            {
               return -1;
            }
            if(this.boundMaxX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMinZ * _loc5_.z >= _loc5_.w - param4)
            {
               return 1;
            }
         }
         else
         {
            if(this.boundMinX * _loc5_.x + this.boundMinY * _loc5_.y + this.boundMinZ * _loc5_.z <= _loc5_.w + param4)
            {
               return -1;
            }
            if(this.boundMaxX * _loc5_.x + this.boundMaxY * _loc5_.y + this.boundMaxZ * _loc5_.z >= _loc5_.w - param4)
            {
               return 1;
            }
         }
         return 0;
      }
      
      alternativa3d function calculatePlane(param1:Vector3D, param2:Vector3D, param3:Vector3D) : Vector3D
      {
         var _loc4_:Vector3D = new Vector3D();
         var _loc5_:Number = param2.x - param1.x;
         var _loc6_:Number = param2.y - param1.y;
         var _loc7_:Number = param2.z - param1.z;
         var _loc8_:Number = param3.x - param1.x;
         var _loc9_:Number = param3.y - param1.y;
         var _loc10_:Number = param3.z - param1.z;
         _loc4_.x = _loc10_ * _loc6_ - _loc9_ * _loc7_;
         _loc4_.y = _loc8_ * _loc7_ - _loc10_ * _loc5_;
         _loc4_.z = _loc9_ * _loc5_ - _loc8_ * _loc6_;
         var _loc11_:Number = _loc4_.x * _loc4_.x + _loc4_.y * _loc4_.y + _loc4_.z * _loc4_.z;
         if(_loc11_ > 0.0001)
         {
            _loc11_ = Math.sqrt(_loc11_);
            _loc4_.x = _loc4_.x / _loc11_;
            _loc4_.y = _loc4_.y / _loc11_;
            _loc4_.z = _loc4_.z / _loc11_;
         }
         _loc4_.w = param1.x * _loc4_.x + param1.y * _loc4_.y + param1.z * _loc4_.z;
         return _loc4_;
      }
      
      alternativa3d function composeMatrix() : void
      {
         var _loc1_:Number = Math.cos(this.rotationX);
         var _loc2_:Number = Math.sin(this.rotationX);
         var _loc3_:Number = Math.cos(this.rotationY);
         var _loc4_:Number = Math.sin(this.rotationY);
         var _loc5_:Number = Math.cos(this.rotationZ);
         var _loc6_:Number = Math.sin(this.rotationZ);
         var _loc7_:Number = _loc5_ * _loc4_;
         var _loc8_:Number = _loc6_ * _loc4_;
         var _loc9_:Number = _loc3_ * this.scaleX;
         var _loc10_:Number = _loc2_ * this.scaleY;
         var _loc11_:Number = _loc1_ * this.scaleY;
         var _loc12_:Number = _loc1_ * this.scaleZ;
         var _loc13_:Number = _loc2_ * this.scaleZ;
         this.alternativa3d::ma = _loc5_ * _loc9_;
         this.alternativa3d::mb = _loc7_ * _loc10_ - _loc6_ * _loc11_;
         this.alternativa3d::mc = _loc7_ * _loc12_ + _loc6_ * _loc13_;
         this.alternativa3d::md = this.x;
         this.alternativa3d::me = _loc6_ * _loc9_;
         this.alternativa3d::mf = _loc8_ * _loc10_ + _loc5_ * _loc11_;
         this.alternativa3d::mg = _loc8_ * _loc12_ - _loc5_ * _loc13_;
         this.alternativa3d::mh = this.y;
         this.alternativa3d::mi = -_loc4_ * this.scaleX;
         this.alternativa3d::mj = _loc3_ * _loc10_;
         this.alternativa3d::mk = _loc3_ * _loc12_;
         this.alternativa3d::ml = this.z;
      }
      
      alternativa3d function composeMatrixFromSource(param1:Object3D) : void
      {
         var _loc2_:Number = Math.cos(param1.rotationX);
         var _loc3_:Number = Math.sin(param1.rotationX);
         var _loc4_:Number = Math.cos(param1.rotationY);
         var _loc5_:Number = Math.sin(param1.rotationY);
         var _loc6_:Number = Math.cos(param1.rotationZ);
         var _loc7_:Number = Math.sin(param1.rotationZ);
         var _loc8_:Number = _loc6_ * _loc5_;
         var _loc9_:Number = _loc7_ * _loc5_;
         var _loc10_:Number = _loc4_ * param1.scaleX;
         var _loc11_:Number = _loc3_ * param1.scaleY;
         var _loc12_:Number = _loc2_ * param1.scaleY;
         var _loc13_:Number = _loc2_ * param1.scaleZ;
         var _loc14_:Number = _loc3_ * param1.scaleZ;
         this.alternativa3d::ma = _loc6_ * _loc10_;
         this.alternativa3d::mb = _loc8_ * _loc11_ - _loc7_ * _loc12_;
         this.alternativa3d::mc = _loc8_ * _loc13_ + _loc7_ * _loc14_;
         this.alternativa3d::md = param1.x;
         this.alternativa3d::me = _loc7_ * _loc10_;
         this.alternativa3d::mf = _loc9_ * _loc11_ + _loc6_ * _loc12_;
         this.alternativa3d::mg = _loc9_ * _loc13_ - _loc6_ * _loc14_;
         this.alternativa3d::mh = param1.y;
         this.alternativa3d::mi = -_loc5_ * param1.scaleX;
         this.alternativa3d::mj = _loc4_ * _loc11_;
         this.alternativa3d::mk = _loc4_ * _loc13_;
         this.alternativa3d::ml = param1.z;
      }
      
      alternativa3d function appendMatrix(param1:Object3D) : void
      {
         var _loc2_:Number = this.alternativa3d::ma;
         var _loc3_:Number = this.alternativa3d::mb;
         var _loc4_:Number = this.alternativa3d::mc;
         var _loc5_:Number = this.alternativa3d::md;
         var _loc6_:Number = this.alternativa3d::me;
         var _loc7_:Number = this.alternativa3d::mf;
         var _loc8_:Number = this.alternativa3d::mg;
         var _loc9_:Number = this.alternativa3d::mh;
         var _loc10_:Number = this.alternativa3d::mi;
         var _loc11_:Number = this.alternativa3d::mj;
         var _loc12_:Number = this.alternativa3d::mk;
         var _loc13_:Number = this.alternativa3d::ml;
         this.alternativa3d::ma = param1.alternativa3d::ma * _loc2_ + param1.alternativa3d::mb * _loc6_ + param1.alternativa3d::mc * _loc10_;
         this.alternativa3d::mb = param1.alternativa3d::ma * _loc3_ + param1.alternativa3d::mb * _loc7_ + param1.alternativa3d::mc * _loc11_;
         this.alternativa3d::mc = param1.alternativa3d::ma * _loc4_ + param1.alternativa3d::mb * _loc8_ + param1.alternativa3d::mc * _loc12_;
         this.alternativa3d::md = param1.alternativa3d::ma * _loc5_ + param1.alternativa3d::mb * _loc9_ + param1.alternativa3d::mc * _loc13_ + param1.alternativa3d::md;
         this.alternativa3d::me = param1.alternativa3d::me * _loc2_ + param1.alternativa3d::mf * _loc6_ + param1.alternativa3d::mg * _loc10_;
         this.alternativa3d::mf = param1.alternativa3d::me * _loc3_ + param1.alternativa3d::mf * _loc7_ + param1.alternativa3d::mg * _loc11_;
         this.alternativa3d::mg = param1.alternativa3d::me * _loc4_ + param1.alternativa3d::mf * _loc8_ + param1.alternativa3d::mg * _loc12_;
         this.alternativa3d::mh = param1.alternativa3d::me * _loc5_ + param1.alternativa3d::mf * _loc9_ + param1.alternativa3d::mg * _loc13_ + param1.alternativa3d::mh;
         this.alternativa3d::mi = param1.alternativa3d::mi * _loc2_ + param1.alternativa3d::mj * _loc6_ + param1.alternativa3d::mk * _loc10_;
         this.alternativa3d::mj = param1.alternativa3d::mi * _loc3_ + param1.alternativa3d::mj * _loc7_ + param1.alternativa3d::mk * _loc11_;
         this.alternativa3d::mk = param1.alternativa3d::mi * _loc4_ + param1.alternativa3d::mj * _loc8_ + param1.alternativa3d::mk * _loc12_;
         this.alternativa3d::ml = param1.alternativa3d::mi * _loc5_ + param1.alternativa3d::mj * _loc9_ + param1.alternativa3d::mk * _loc13_ + param1.alternativa3d::ml;
      }
      
      alternativa3d function composeAndAppend(param1:Object3D) : void
      {
         var _loc2_:Number = Math.cos(this.rotationX);
         var _loc3_:Number = Math.sin(this.rotationX);
         var _loc4_:Number = Math.cos(this.rotationY);
         var _loc5_:Number = Math.sin(this.rotationY);
         var _loc6_:Number = Math.cos(this.rotationZ);
         var _loc7_:Number = Math.sin(this.rotationZ);
         var _loc8_:Number = _loc6_ * _loc5_;
         var _loc9_:Number = _loc7_ * _loc5_;
         var _loc10_:Number = _loc4_ * this.scaleX;
         var _loc11_:Number = _loc3_ * this.scaleY;
         var _loc12_:Number = _loc2_ * this.scaleY;
         var _loc13_:Number = _loc2_ * this.scaleZ;
         var _loc14_:Number = _loc3_ * this.scaleZ;
         var _loc15_:Number = _loc6_ * _loc10_;
         var _loc16_:Number = _loc8_ * _loc11_ - _loc7_ * _loc12_;
         var _loc17_:Number = _loc8_ * _loc13_ + _loc7_ * _loc14_;
         var _loc18_:Number = this.x;
         var _loc19_:Number = _loc7_ * _loc10_;
         var _loc20_:Number = _loc9_ * _loc11_ + _loc6_ * _loc12_;
         var _loc21_:Number = _loc9_ * _loc13_ - _loc6_ * _loc14_;
         var _loc22_:Number = this.y;
         var _loc23_:Number = -_loc5_ * this.scaleX;
         var _loc24_:Number = _loc4_ * _loc11_;
         var _loc25_:Number = _loc4_ * _loc13_;
         var _loc26_:Number = this.z;
         this.alternativa3d::ma = param1.alternativa3d::ma * _loc15_ + param1.alternativa3d::mb * _loc19_ + param1.alternativa3d::mc * _loc23_;
         this.alternativa3d::mb = param1.alternativa3d::ma * _loc16_ + param1.alternativa3d::mb * _loc20_ + param1.alternativa3d::mc * _loc24_;
         this.alternativa3d::mc = param1.alternativa3d::ma * _loc17_ + param1.alternativa3d::mb * _loc21_ + param1.alternativa3d::mc * _loc25_;
         this.alternativa3d::md = param1.alternativa3d::ma * _loc18_ + param1.alternativa3d::mb * _loc22_ + param1.alternativa3d::mc * _loc26_ + param1.alternativa3d::md;
         this.alternativa3d::me = param1.alternativa3d::me * _loc15_ + param1.alternativa3d::mf * _loc19_ + param1.alternativa3d::mg * _loc23_;
         this.alternativa3d::mf = param1.alternativa3d::me * _loc16_ + param1.alternativa3d::mf * _loc20_ + param1.alternativa3d::mg * _loc24_;
         this.alternativa3d::mg = param1.alternativa3d::me * _loc17_ + param1.alternativa3d::mf * _loc21_ + param1.alternativa3d::mg * _loc25_;
         this.alternativa3d::mh = param1.alternativa3d::me * _loc18_ + param1.alternativa3d::mf * _loc22_ + param1.alternativa3d::mg * _loc26_ + param1.alternativa3d::mh;
         this.alternativa3d::mi = param1.alternativa3d::mi * _loc15_ + param1.alternativa3d::mj * _loc19_ + param1.alternativa3d::mk * _loc23_;
         this.alternativa3d::mj = param1.alternativa3d::mi * _loc16_ + param1.alternativa3d::mj * _loc20_ + param1.alternativa3d::mk * _loc24_;
         this.alternativa3d::mk = param1.alternativa3d::mi * _loc17_ + param1.alternativa3d::mj * _loc21_ + param1.alternativa3d::mk * _loc25_;
         this.alternativa3d::ml = param1.alternativa3d::mi * _loc18_ + param1.alternativa3d::mj * _loc22_ + param1.alternativa3d::mk * _loc26_ + param1.alternativa3d::ml;
      }
      
      alternativa3d function copyAndAppend(param1:Object3D, param2:Object3D) : void
      {
         this.alternativa3d::ma = param2.alternativa3d::ma * param1.alternativa3d::ma + param2.alternativa3d::mb * param1.alternativa3d::me + param2.alternativa3d::mc * param1.alternativa3d::mi;
         this.alternativa3d::mb = param2.alternativa3d::ma * param1.alternativa3d::mb + param2.alternativa3d::mb * param1.alternativa3d::mf + param2.alternativa3d::mc * param1.alternativa3d::mj;
         this.alternativa3d::mc = param2.alternativa3d::ma * param1.alternativa3d::mc + param2.alternativa3d::mb * param1.alternativa3d::mg + param2.alternativa3d::mc * param1.alternativa3d::mk;
         this.alternativa3d::md = param2.alternativa3d::ma * param1.alternativa3d::md + param2.alternativa3d::mb * param1.alternativa3d::mh + param2.alternativa3d::mc * param1.alternativa3d::ml + param2.alternativa3d::md;
         this.alternativa3d::me = param2.alternativa3d::me * param1.alternativa3d::ma + param2.alternativa3d::mf * param1.alternativa3d::me + param2.alternativa3d::mg * param1.alternativa3d::mi;
         this.alternativa3d::mf = param2.alternativa3d::me * param1.alternativa3d::mb + param2.alternativa3d::mf * param1.alternativa3d::mf + param2.alternativa3d::mg * param1.alternativa3d::mj;
         this.alternativa3d::mg = param2.alternativa3d::me * param1.alternativa3d::mc + param2.alternativa3d::mf * param1.alternativa3d::mg + param2.alternativa3d::mg * param1.alternativa3d::mk;
         this.alternativa3d::mh = param2.alternativa3d::me * param1.alternativa3d::md + param2.alternativa3d::mf * param1.alternativa3d::mh + param2.alternativa3d::mg * param1.alternativa3d::ml + param2.alternativa3d::mh;
         this.alternativa3d::mi = param2.alternativa3d::mi * param1.alternativa3d::ma + param2.alternativa3d::mj * param1.alternativa3d::me + param2.alternativa3d::mk * param1.alternativa3d::mi;
         this.alternativa3d::mj = param2.alternativa3d::mi * param1.alternativa3d::mb + param2.alternativa3d::mj * param1.alternativa3d::mf + param2.alternativa3d::mk * param1.alternativa3d::mj;
         this.alternativa3d::mk = param2.alternativa3d::mi * param1.alternativa3d::mc + param2.alternativa3d::mj * param1.alternativa3d::mg + param2.alternativa3d::mk * param1.alternativa3d::mk;
         this.alternativa3d::ml = param2.alternativa3d::mi * param1.alternativa3d::md + param2.alternativa3d::mj * param1.alternativa3d::mh + param2.alternativa3d::mk * param1.alternativa3d::ml + param2.alternativa3d::ml;
      }
      
      alternativa3d function invertMatrix() : void
      {
         var _loc1_:Number = this.alternativa3d::ma;
         var _loc2_:Number = this.alternativa3d::mb;
         var _loc3_:Number = this.alternativa3d::mc;
         var _loc4_:Number = this.alternativa3d::md;
         var _loc5_:Number = this.alternativa3d::me;
         var _loc6_:Number = this.alternativa3d::mf;
         var _loc7_:Number = this.alternativa3d::mg;
         var _loc8_:Number = this.alternativa3d::mh;
         var _loc9_:Number = this.alternativa3d::mi;
         var _loc10_:Number = this.alternativa3d::mj;
         var _loc11_:Number = this.alternativa3d::mk;
         var _loc12_:Number = this.alternativa3d::ml;
         var _loc13_:Number = 1 / (-_loc3_ * _loc6_ * _loc9_ + _loc2_ * _loc7_ * _loc9_ + _loc3_ * _loc5_ * _loc10_ - _loc1_ * _loc7_ * _loc10_ - _loc2_ * _loc5_ * _loc11_ + _loc1_ * _loc6_ * _loc11_);
         this.alternativa3d::ma = (-_loc7_ * _loc10_ + _loc6_ * _loc11_) * _loc13_;
         this.alternativa3d::mb = (_loc3_ * _loc10_ - _loc2_ * _loc11_) * _loc13_;
         this.alternativa3d::mc = (-_loc3_ * _loc6_ + _loc2_ * _loc7_) * _loc13_;
         this.alternativa3d::md = (_loc4_ * _loc7_ * _loc10_ - _loc3_ * _loc8_ * _loc10_ - _loc4_ * _loc6_ * _loc11_ + _loc2_ * _loc8_ * _loc11_ + _loc3_ * _loc6_ * _loc12_ - _loc2_ * _loc7_ * _loc12_) * _loc13_;
         this.alternativa3d::me = (_loc7_ * _loc9_ - _loc5_ * _loc11_) * _loc13_;
         this.alternativa3d::mf = (-_loc3_ * _loc9_ + _loc1_ * _loc11_) * _loc13_;
         this.alternativa3d::mg = (_loc3_ * _loc5_ - _loc1_ * _loc7_) * _loc13_;
         this.alternativa3d::mh = (_loc3_ * _loc8_ * _loc9_ - _loc4_ * _loc7_ * _loc9_ + _loc4_ * _loc5_ * _loc11_ - _loc1_ * _loc8_ * _loc11_ - _loc3_ * _loc5_ * _loc12_ + _loc1_ * _loc7_ * _loc12_) * _loc13_;
         this.alternativa3d::mi = (-_loc6_ * _loc9_ + _loc5_ * _loc10_) * _loc13_;
         this.alternativa3d::mj = (_loc2_ * _loc9_ - _loc1_ * _loc10_) * _loc13_;
         this.alternativa3d::mk = (-_loc2_ * _loc5_ + _loc1_ * _loc6_) * _loc13_;
         this.alternativa3d::ml = (_loc4_ * _loc6_ * _loc9_ - _loc2_ * _loc8_ * _loc9_ - _loc4_ * _loc5_ * _loc10_ + _loc1_ * _loc8_ * _loc10_ + _loc2_ * _loc5_ * _loc12_ - _loc1_ * _loc6_ * _loc12_) * _loc13_;
      }
      
      alternativa3d function calculateInverseMatrix() : void
      {
         var _loc1_:Number = 1 / (-this.alternativa3d::mc * this.alternativa3d::mf * this.alternativa3d::mi + this.alternativa3d::mb * this.alternativa3d::mg * this.alternativa3d::mi + this.alternativa3d::mc * this.alternativa3d::me * this.alternativa3d::mj - this.alternativa3d::ma * this.alternativa3d::mg * this.alternativa3d::mj - this.alternativa3d::mb * this.alternativa3d::me * this.alternativa3d::mk + this.alternativa3d::ma * this.alternativa3d::mf * this.alternativa3d::mk);
         this.alternativa3d::ima = (-this.alternativa3d::mg * this.alternativa3d::mj + this.alternativa3d::mf * this.alternativa3d::mk) * _loc1_;
         this.alternativa3d::imb = (this.alternativa3d::mc * this.alternativa3d::mj - this.alternativa3d::mb * this.alternativa3d::mk) * _loc1_;
         this.alternativa3d::imc = (-this.alternativa3d::mc * this.alternativa3d::mf + this.alternativa3d::mb * this.alternativa3d::mg) * _loc1_;
         this.alternativa3d::imd = (this.alternativa3d::md * this.alternativa3d::mg * this.alternativa3d::mj - this.alternativa3d::mc * this.alternativa3d::mh * this.alternativa3d::mj - this.alternativa3d::md * this.alternativa3d::mf * this.alternativa3d::mk + this.alternativa3d::mb * this.alternativa3d::mh * this.alternativa3d::mk + this.alternativa3d::mc * this.alternativa3d::mf * this.alternativa3d::ml - this.alternativa3d::mb * this.alternativa3d::mg * this.alternativa3d::ml) * _loc1_;
         this.alternativa3d::ime = (this.alternativa3d::mg * this.alternativa3d::mi - this.alternativa3d::me * this.alternativa3d::mk) * _loc1_;
         this.alternativa3d::imf = (-this.alternativa3d::mc * this.alternativa3d::mi + this.alternativa3d::ma * this.alternativa3d::mk) * _loc1_;
         this.alternativa3d::img = (this.alternativa3d::mc * this.alternativa3d::me - this.alternativa3d::ma * this.alternativa3d::mg) * _loc1_;
         this.alternativa3d::imh = (this.alternativa3d::mc * this.alternativa3d::mh * this.alternativa3d::mi - this.alternativa3d::md * this.alternativa3d::mg * this.alternativa3d::mi + this.alternativa3d::md * this.alternativa3d::me * this.alternativa3d::mk - this.alternativa3d::ma * this.alternativa3d::mh * this.alternativa3d::mk - this.alternativa3d::mc * this.alternativa3d::me * this.alternativa3d::ml + this.alternativa3d::ma * this.alternativa3d::mg * this.alternativa3d::ml) * _loc1_;
         this.alternativa3d::imi = (-this.alternativa3d::mf * this.alternativa3d::mi + this.alternativa3d::me * this.alternativa3d::mj) * _loc1_;
         this.alternativa3d::imj = (this.alternativa3d::mb * this.alternativa3d::mi - this.alternativa3d::ma * this.alternativa3d::mj) * _loc1_;
         this.alternativa3d::imk = (-this.alternativa3d::mb * this.alternativa3d::me + this.alternativa3d::ma * this.alternativa3d::mf) * _loc1_;
         this.alternativa3d::iml = (this.alternativa3d::md * this.alternativa3d::mf * this.alternativa3d::mi - this.alternativa3d::mb * this.alternativa3d::mh * this.alternativa3d::mi - this.alternativa3d::md * this.alternativa3d::me * this.alternativa3d::mj + this.alternativa3d::ma * this.alternativa3d::mh * this.alternativa3d::mj + this.alternativa3d::mb * this.alternativa3d::me * this.alternativa3d::ml - this.alternativa3d::ma * this.alternativa3d::mf * this.alternativa3d::ml) * _loc1_;
      }
      
      alternativa3d function cullingInCamera(param1:Camera3D, param2:int) : int
      {
         var _loc3_:Vertex = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:Vertex = null;
         if(param1.alternativa3d::occludedAll)
         {
            return -1;
         }
         var _loc13_:int = param1.alternativa3d::numOccluders;
         if(param2 > 0 || _loc13_ > 0)
         {
            _loc3_ = alternativa3d::boundVertexList;
            _loc3_.x = this.boundMinX;
            _loc3_.y = this.boundMinY;
            _loc3_.z = this.boundMinZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMaxX;
            _loc3_.y = this.boundMinY;
            _loc3_.z = this.boundMinZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMinX;
            _loc3_.y = this.boundMaxY;
            _loc3_.z = this.boundMinZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMaxX;
            _loc3_.y = this.boundMaxY;
            _loc3_.z = this.boundMinZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMinX;
            _loc3_.y = this.boundMinY;
            _loc3_.z = this.boundMaxZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMaxX;
            _loc3_.y = this.boundMinY;
            _loc3_.z = this.boundMaxZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMinX;
            _loc3_.y = this.boundMaxY;
            _loc3_.z = this.boundMaxZ;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.boundMaxX;
            _loc3_.y = this.boundMaxY;
            _loc3_.z = this.boundMaxZ;
            _loc3_ = alternativa3d::boundVertexList;
            while(_loc3_ != null)
            {
               _loc4_ = _loc3_.x;
               _loc5_ = _loc3_.y;
               _loc6_ = _loc3_.z;
               _loc3_.alternativa3d::cameraX = this.alternativa3d::ma * _loc4_ + this.alternativa3d::mb * _loc5_ + this.alternativa3d::mc * _loc6_ + this.alternativa3d::md;
               _loc3_.alternativa3d::cameraY = this.alternativa3d::me * _loc4_ + this.alternativa3d::mf * _loc5_ + this.alternativa3d::mg * _loc6_ + this.alternativa3d::mh;
               _loc3_.alternativa3d::cameraZ = this.alternativa3d::mi * _loc4_ + this.alternativa3d::mj * _loc5_ + this.alternativa3d::mk * _loc6_ + this.alternativa3d::ml;
               _loc3_ = _loc3_.alternativa3d::next;
            }
         }
         if(param2 > 0)
         {
            if(param2 & 1)
            {
               _loc9_ = param1.nearClipping;
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(_loc3_.alternativa3d::cameraZ > _loc9_)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x3E;
               }
            }
            if(param2 & 2)
            {
               _loc10_ = param1.farClipping;
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(_loc3_.alternativa3d::cameraZ < _loc10_)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x3D;
               }
            }
            if(param2 & 4)
            {
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(-_loc3_.alternativa3d::cameraX < _loc3_.alternativa3d::cameraZ)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x3B;
               }
            }
            if(param2 & 8)
            {
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(_loc3_.alternativa3d::cameraX < _loc3_.alternativa3d::cameraZ)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x37;
               }
            }
            if(param2 & 0x10)
            {
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(-_loc3_.alternativa3d::cameraY < _loc3_.alternativa3d::cameraZ)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x2F;
               }
            }
            if(param2 & 0x20)
            {
               _loc3_ = alternativa3d::boundVertexList;
               _loc7_ = false;
               _loc8_ = false;
               while(_loc3_ != null)
               {
                  if(_loc3_.alternativa3d::cameraY < _loc3_.alternativa3d::cameraZ)
                  {
                     _loc7_ = true;
                     if(_loc8_)
                     {
                        break;
                     }
                  }
                  else
                  {
                     _loc8_ = true;
                     if(_loc7_)
                     {
                        break;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
               if(_loc8_)
               {
                  if(!_loc7_)
                  {
                     return -1;
                  }
               }
               else
               {
                  param2 = param2 & 0x1F;
               }
            }
         }
         if(_loc13_ > 0)
         {
            _loc11_ = 0;
            while(true)
            {
               if(_loc11_ < _loc13_)
               {
                  _loc12_ = param1.alternativa3d::occluders[_loc11_];
                  while(_loc12_ != null)
                  {
                     _loc3_ = alternativa3d::boundVertexList;
                     while(_loc3_ != null)
                     {
                        if(_loc12_.alternativa3d::cameraX * _loc3_.alternativa3d::cameraX + _loc12_.alternativa3d::cameraY * _loc3_.alternativa3d::cameraY + _loc12_.alternativa3d::cameraZ * _loc3_.alternativa3d::cameraZ >= 0)
                        {
                           break;
                        }
                        _loc3_ = _loc3_.alternativa3d::next;
                     }
                     if(_loc3_ != null)
                     {
                        break;
                     }
                     _loc12_ = _loc12_.alternativa3d::next;
                  }
                  if(_loc12_ == null)
                  {
                     break;
                  }
                  _loc11_++;
               }
            }
            return -1;
         }
         this.alternativa3d::culling = param2;
         return param2;
      }
      
      alternativa3d function removeFromParent() : void
      {
         var _loc1_:Object3D = null;
         if(this.alternativa3d::_parent != null)
         {
            _loc1_ = this.alternativa3d::_parent.removeChild(this);
            _loc1_ = null;
         }
      }
   }
}


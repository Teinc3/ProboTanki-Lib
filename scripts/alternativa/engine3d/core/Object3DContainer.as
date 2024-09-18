package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class Object3DContainer extends Object3D
   {
      public var mouseChildren:Boolean = true;
      
      alternativa3d var childrenList:Object3D;
      
      alternativa3d var lightList:Light3D;
      
      alternativa3d var visibleChildren:Vector.<Object3D>;
      
      alternativa3d var numVisibleChildren:int = 0;
      
      public function Object3DContainer()
      {
         this.alternativa3d::visibleChildren = new Vector.<Object3D>();
         super();
      }
      
      public function addChild(param1:Object3D) : Object3D
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1 == this)
         {
            throw new ArgumentError("An object cannot be added as a child of itself.");
         }
         var _loc2_:Object3DContainer = alternativa3d::_parent;
         while(_loc2_ != null)
         {
            if(_loc2_ == param1)
            {
               throw new ArgumentError("An object cannot be added as a child to one of it\'s children (or children\'s children, etc.).");
            }
            _loc2_ = _loc2_.alternativa3d::_parent;
         }
         if(param1.alternativa3d::_parent != null)
         {
            param1.alternativa3d::_parent.removeChild(param1);
         }
         this.alternativa3d::addToList(param1);
         return param1;
      }
      
      public function removeChild(param1:Object3D) : Object3D
      {
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1.alternativa3d::_parent != this)
         {
            throw new ArgumentError("The supplied Object3D must be a child of the caller.");
         }
         _loc3_ = this.alternativa3d::childrenList;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.alternativa3d::next = _loc3_.alternativa3d::next;
               }
               else
               {
                  this.alternativa3d::childrenList = _loc3_.alternativa3d::next;
               }
               _loc3_.alternativa3d::next = null;
               _loc3_.alternativa3d::setParent(null);
               return param1;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         throw new ArgumentError("Cannot remove child.");
      }
      
      public function addChildAt(param1:Object3D, param2:int) : Object3D
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1 == this)
         {
            throw new ArgumentError("An object cannot be added as a child of itself.");
         }
         if(param2 < 0)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         var _loc3_:Object3DContainer = alternativa3d::_parent;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               throw new ArgumentError("An object cannot be added as a child to one of it\'s children (or children\'s children, etc.).");
            }
            _loc3_ = _loc3_.alternativa3d::_parent;
         }
         var _loc4_:Object3D = this.alternativa3d::childrenList;
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            if(_loc4_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            _loc4_ = _loc4_.alternativa3d::next;
            _loc5_++;
         }
         if(param1.alternativa3d::_parent != null)
         {
            param1.alternativa3d::_parent.removeChild(param1);
         }
         this.alternativa3d::addToList(param1,_loc4_);
         return param1;
      }
      
      public function removeChildAt(param1:int) : Object3D
      {
         if(param1 < 0)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         var _loc2_:Object3D = this.alternativa3d::childrenList;
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(_loc2_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            _loc2_ = _loc2_.alternativa3d::next;
            _loc3_++;
         }
         if(_loc2_ == null)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         this.removeChild(_loc2_);
         return _loc2_;
      }
      
      public function getChildAt(param1:int) : Object3D
      {
         if(param1 < 0)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         var _loc2_:Object3D = this.alternativa3d::childrenList;
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            if(_loc2_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            _loc2_ = _loc2_.alternativa3d::next;
            _loc3_++;
         }
         if(_loc2_ == null)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         return _loc2_;
      }
      
      public function getChildIndex(param1:Object3D) : int
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1.alternativa3d::_parent != this)
         {
            throw new ArgumentError("The supplied Object3D must be a child of the caller.");
         }
         var _loc2_:int = 0;
         var _loc3_:Object3D = this.alternativa3d::childrenList;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               return _loc2_;
            }
            _loc2_++;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         throw new ArgumentError("Cannot get child index.");
      }
      
      public function setChildIndex(param1:Object3D, param2:int) : void
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1.alternativa3d::_parent != this)
         {
            throw new ArgumentError("The supplied Object3D must be a child of the caller.");
         }
         if(param2 < 0)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         var _loc3_:Object3D = this.alternativa3d::childrenList;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            if(_loc3_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            _loc3_ = _loc3_.alternativa3d::next;
            _loc4_++;
         }
         this.removeChild(param1);
         this.alternativa3d::addToList(param1,_loc3_);
      }
      
      public function swapChildren(param1:Object3D, param2:Object3D) : void
      {
         var _loc3_:Object3D = null;
         if(param1 == null || param2 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1.alternativa3d::_parent != this || param2.alternativa3d::_parent != this)
         {
            throw new ArgumentError("The supplied Object3D must be a child of the caller.");
         }
         if(param1 != param2)
         {
            if(param1.alternativa3d::next == param2)
            {
               this.removeChild(param2);
               this.alternativa3d::addToList(param2,param1);
            }
            else if(param2.alternativa3d::next == param1)
            {
               this.removeChild(param1);
               this.alternativa3d::addToList(param1,param2);
            }
            else
            {
               _loc3_ = param1.alternativa3d::next;
               this.removeChild(param1);
               this.alternativa3d::addToList(param1,param2);
               this.removeChild(param2);
               this.alternativa3d::addToList(param2,_loc3_);
            }
         }
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object3D = null;
         var _loc5_:Object3D = null;
         var _loc6_:Object3D = null;
         if(param1 < 0 || param2 < 0)
         {
            throw new RangeError("The supplied index is out of bounds.");
         }
         if(param1 != param2)
         {
            _loc4_ = this.alternativa3d::childrenList;
            _loc3_ = 0;
            while(_loc3_ < param1)
            {
               if(_loc4_ == null)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               _loc4_ = _loc4_.alternativa3d::next;
               _loc3_++;
            }
            if(_loc4_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            _loc5_ = this.alternativa3d::childrenList;
            _loc3_ = 0;
            while(_loc3_ < param2)
            {
               if(_loc5_ == null)
               {
                  throw new RangeError("The supplied index is out of bounds.");
               }
               _loc5_ = _loc5_.alternativa3d::next;
               _loc3_++;
            }
            if(_loc5_ == null)
            {
               throw new RangeError("The supplied index is out of bounds.");
            }
            if(_loc4_ != _loc5_)
            {
               if(_loc4_.alternativa3d::next == _loc5_)
               {
                  this.removeChild(_loc5_);
                  this.alternativa3d::addToList(_loc5_,_loc4_);
               }
               else if(_loc5_.alternativa3d::next == _loc4_)
               {
                  this.removeChild(_loc4_);
                  this.alternativa3d::addToList(_loc4_,_loc5_);
               }
               else
               {
                  _loc6_ = _loc4_.alternativa3d::next;
                  this.removeChild(_loc4_);
                  this.alternativa3d::addToList(_loc4_,_loc5_);
                  this.removeChild(_loc5_);
                  this.alternativa3d::addToList(_loc5_,_loc6_);
               }
            }
         }
      }
      
      public function getChildByName(param1:String) : Object3D
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter name must be non-null.");
         }
         var _loc2_:Object3D = this.alternativa3d::childrenList;
         while(_loc2_ != null)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return null;
      }
      
      public function contains(param1:Object3D) : Boolean
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter child must be non-null.");
         }
         if(param1 == this)
         {
            return true;
         }
         var _loc2_:Object3D = this.alternativa3d::childrenList;
         while(_loc2_ != null)
         {
            if(_loc2_ is Object3DContainer)
            {
               if((_loc2_ as Object3DContainer).contains(param1))
               {
                  return true;
               }
            }
            else if(_loc2_ == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return false;
      }
      
      public function get numChildren() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Object3D = this.alternativa3d::childrenList;
         while(_loc2_ != null)
         {
            _loc1_++;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return _loc1_;
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:Vector3D = null;
         var _loc6_:Vector3D = null;
         var _loc7_:RayIntersectionData = null;
         var _loc8_:RayIntersectionData = null;
         if(param3 != null && Boolean(param3[this]))
         {
            return null;
         }
         if(!alternativa3d::boundIntersectRay(param1,param2,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return null;
         }
         var _loc9_:Number = 1e+22;
         var _loc10_:Object3D = this.alternativa3d::childrenList;
         while(_loc10_ != null)
         {
            _loc10_.alternativa3d::composeMatrix();
            _loc10_.alternativa3d::invertMatrix();
            if(_loc5_ == null)
            {
               _loc5_ = new Vector3D();
               _loc6_ = new Vector3D();
            }
            _loc5_.x = _loc10_.alternativa3d::ma * param1.x + _loc10_.alternativa3d::mb * param1.y + _loc10_.alternativa3d::mc * param1.z + _loc10_.alternativa3d::md;
            _loc5_.y = _loc10_.alternativa3d::me * param1.x + _loc10_.alternativa3d::mf * param1.y + _loc10_.alternativa3d::mg * param1.z + _loc10_.alternativa3d::mh;
            _loc5_.z = _loc10_.alternativa3d::mi * param1.x + _loc10_.alternativa3d::mj * param1.y + _loc10_.alternativa3d::mk * param1.z + _loc10_.alternativa3d::ml;
            _loc6_.x = _loc10_.alternativa3d::ma * param2.x + _loc10_.alternativa3d::mb * param2.y + _loc10_.alternativa3d::mc * param2.z;
            _loc6_.y = _loc10_.alternativa3d::me * param2.x + _loc10_.alternativa3d::mf * param2.y + _loc10_.alternativa3d::mg * param2.z;
            _loc6_.z = _loc10_.alternativa3d::mi * param2.x + _loc10_.alternativa3d::mj * param2.y + _loc10_.alternativa3d::mk * param2.z;
            _loc8_ = _loc10_.intersectRay(_loc5_,_loc6_,param3,param4);
            if(_loc8_ != null && _loc8_.time < _loc9_)
            {
               _loc9_ = _loc8_.time;
               _loc7_ = _loc8_;
            }
            _loc10_ = _loc10_.alternativa3d::next;
         }
         return _loc7_;
      }
      
      override alternativa3d function checkIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Dictionary) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Object3D = this.alternativa3d::childrenList;
         while(_loc15_ != null)
         {
            if(param8 != null && !param8[_loc15_])
            {
               _loc15_.alternativa3d::composeMatrix();
               _loc15_.alternativa3d::invertMatrix();
               _loc9_ = _loc15_.alternativa3d::ma * param1 + _loc15_.alternativa3d::mb * param2 + _loc15_.alternativa3d::mc * param3 + _loc15_.alternativa3d::md;
               _loc10_ = _loc15_.alternativa3d::me * param1 + _loc15_.alternativa3d::mf * param2 + _loc15_.alternativa3d::mg * param3 + _loc15_.alternativa3d::mh;
               _loc11_ = _loc15_.alternativa3d::mi * param1 + _loc15_.alternativa3d::mj * param2 + _loc15_.alternativa3d::mk * param3 + _loc15_.alternativa3d::ml;
               _loc12_ = _loc15_.alternativa3d::ma * param4 + _loc15_.alternativa3d::mb * param5 + _loc15_.alternativa3d::mc * param6;
               _loc13_ = _loc15_.alternativa3d::me * param4 + _loc15_.alternativa3d::mf * param5 + _loc15_.alternativa3d::mg * param6;
               _loc14_ = _loc15_.alternativa3d::mi * param4 + _loc15_.alternativa3d::mj * param5 + _loc15_.alternativa3d::mk * param6;
               if(Boolean(alternativa3d::boundCheckIntersection(_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,param7,_loc15_.boundMinX,_loc15_.boundMinY,_loc15_.boundMinZ,_loc15_.boundMaxX,_loc15_.boundMaxY,_loc15_.boundMaxZ)) && _loc15_.alternativa3d::checkIntersection(_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,param7,param8))
               {
                  return true;
               }
            }
            _loc15_ = _loc15_.alternativa3d::next;
         }
         return false;
      }
      
      override alternativa3d function collectPlanes(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector.<Face>, param7:Dictionary = null) : void
      {
         if(param7 != null && Boolean(param7[this]))
         {
            return;
         }
         var _loc8_:Vector3D = alternativa3d::calculateSphere(param1,param2,param3,param4,param5);
         if(!alternativa3d::boundIntersectSphere(_loc8_,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return;
         }
         var _loc9_:Object3D = this.alternativa3d::childrenList;
         while(_loc9_ != null)
         {
            _loc9_.alternativa3d::composeAndAppend(this);
            _loc9_.alternativa3d::collectPlanes(param1,param2,param3,param4,param5,param6,param7);
            _loc9_ = _loc9_.alternativa3d::next;
         }
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Object3DContainer = new Object3DContainer();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         super.clonePropertiesFrom(param1);
         var _loc4_:Object3DContainer = param1 as Object3DContainer;
         this.mouseChildren = _loc4_.mouseChildren;
         var _loc5_:Object3D = _loc4_.alternativa3d::childrenList;
         while(_loc5_ != null)
         {
            _loc3_ = _loc5_.clone();
            if(this.alternativa3d::childrenList != null)
            {
               _loc2_.alternativa3d::next = _loc3_;
            }
            else
            {
               this.alternativa3d::childrenList = _loc3_;
            }
            _loc2_ = _loc3_;
            _loc3_.alternativa3d::setParent(this);
            _loc5_ = _loc5_.alternativa3d::next;
         }
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         this.alternativa3d::numVisibleChildren = 0;
         var _loc3_:Object3D = this.alternativa3d::childrenList;
         while(_loc3_ != null)
         {
            if(_loc3_.visible)
            {
               _loc3_.alternativa3d::composeAndAppend(this);
               if(_loc3_.alternativa3d::cullingInCamera(param1,alternativa3d::culling) >= 0)
               {
                  _loc3_.alternativa3d::concat(this);
                  this.alternativa3d::visibleChildren[this.alternativa3d::numVisibleChildren] = _loc3_;
                  ++this.alternativa3d::numVisibleChildren;
               }
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(this.alternativa3d::numVisibleChildren > 0)
         {
            if(param1.debug && (_loc2_ = param1.alternativa3d::checkInDebug(this)) > 0)
            {
               if(_loc2_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            this.alternativa3d::drawVisibleChildren(param1);
         }
      }
      
      alternativa3d function drawVisibleChildren(param1:Camera3D) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:int = this.alternativa3d::numVisibleChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ = this.alternativa3d::visibleChildren[_loc3_];
            _loc2_.alternativa3d::draw(param1);
            this.alternativa3d::visibleChildren[_loc3_] = null;
            _loc3_--;
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _loc2_:VG = null;
         var _loc3_:VG = null;
         var _loc4_:VG = null;
         var _loc5_:Object3D = this.alternativa3d::childrenList;
         while(_loc5_ != null)
         {
            if(_loc5_.visible)
            {
               _loc5_.alternativa3d::composeAndAppend(this);
               if(_loc5_.alternativa3d::cullingInCamera(param1,alternativa3d::culling) >= 0)
               {
                  _loc5_.alternativa3d::concat(this);
                  _loc4_ = _loc5_.alternativa3d::getVG(param1);
                  if(_loc4_ != null)
                  {
                     if(_loc2_ != null)
                     {
                        _loc3_.alternativa3d::next = _loc4_;
                     }
                     else
                     {
                        _loc2_ = _loc4_;
                        _loc3_ = _loc4_;
                     }
                     while(_loc3_.alternativa3d::next != null)
                     {
                        _loc3_ = _loc3_.alternativa3d::next;
                     }
                  }
               }
            }
            _loc5_ = _loc5_.alternativa3d::next;
         }
         return _loc2_;
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Object3D = this.alternativa3d::childrenList;
         while(_loc3_ != null)
         {
            if(param2 != null)
            {
               _loc3_.alternativa3d::composeAndAppend(param2);
            }
            else
            {
               _loc3_.alternativa3d::composeMatrix();
            }
            _loc3_.alternativa3d::updateBounds(param1,_loc3_);
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      override alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         var _loc5_:Object3D = null;
         var _loc6_:Object3D = null;
         var _loc7_:Object3D = null;
         var _loc8_:Vector3D = null;
         var _loc9_:Vector3D = null;
         var _loc10_:Vector3D = null;
         var _loc11_:int = 0;
         var _loc12_:Vector.<Object3D> = null;
         var _loc13_:Number = NaN;
         var _loc14_:Vector.<Object3D> = new Vector.<Object3D>(2);
         var _loc15_:Vector3D = alternativa3d::calculatePlane(param1,param2,param3);
         var _loc16_:Object3D = this.alternativa3d::childrenList;
         this.alternativa3d::childrenList = null;
         var _loc17_:Object3DContainer = this.clone() as Object3DContainer;
         var _loc18_:Object3DContainer = this.clone() as Object3DContainer;
         var _loc19_:Object3D = _loc16_;
         while(_loc19_ != null)
         {
            _loc7_ = _loc19_.alternativa3d::next;
            _loc19_.alternativa3d::next = null;
            _loc19_.alternativa3d::setParent(null);
            _loc19_.alternativa3d::composeMatrix();
            _loc19_.alternativa3d::calculateInverseMatrix();
            _loc8_ = new Vector3D(_loc19_.alternativa3d::ima * param1.x + _loc19_.alternativa3d::imb * param1.y + _loc19_.alternativa3d::imc * param1.z + _loc19_.alternativa3d::imd,_loc19_.alternativa3d::ime * param1.x + _loc19_.alternativa3d::imf * param1.y + _loc19_.alternativa3d::img * param1.z + _loc19_.alternativa3d::imh,_loc19_.alternativa3d::imi * param1.x + _loc19_.alternativa3d::imj * param1.y + _loc19_.alternativa3d::imk * param1.z + _loc19_.alternativa3d::iml);
            _loc9_ = new Vector3D(_loc19_.alternativa3d::ima * param2.x + _loc19_.alternativa3d::imb * param2.y + _loc19_.alternativa3d::imc * param2.z + _loc19_.alternativa3d::imd,_loc19_.alternativa3d::ime * param2.x + _loc19_.alternativa3d::imf * param2.y + _loc19_.alternativa3d::img * param2.z + _loc19_.alternativa3d::imh,_loc19_.alternativa3d::imi * param2.x + _loc19_.alternativa3d::imj * param2.y + _loc19_.alternativa3d::imk * param2.z + _loc19_.alternativa3d::iml);
            _loc10_ = new Vector3D(_loc19_.alternativa3d::ima * param3.x + _loc19_.alternativa3d::imb * param3.y + _loc19_.alternativa3d::imc * param3.z + _loc19_.alternativa3d::imd,_loc19_.alternativa3d::ime * param3.x + _loc19_.alternativa3d::imf * param3.y + _loc19_.alternativa3d::img * param3.z + _loc19_.alternativa3d::imh,_loc19_.alternativa3d::imi * param3.x + _loc19_.alternativa3d::imj * param3.y + _loc19_.alternativa3d::imk * param3.z + _loc19_.alternativa3d::iml);
            _loc11_ = _loc19_.alternativa3d::testSplit(_loc8_,_loc9_,_loc10_,param4);
            if(_loc11_ < 0)
            {
               if(_loc5_ != null)
               {
                  _loc5_.alternativa3d::next = _loc19_;
               }
               else
               {
                  _loc17_.alternativa3d::childrenList = _loc19_;
               }
               _loc5_ = _loc19_;
               _loc19_.alternativa3d::setParent(_loc17_);
            }
            else if(_loc11_ > 0)
            {
               if(_loc6_ != null)
               {
                  _loc6_.alternativa3d::next = _loc19_;
               }
               else
               {
                  _loc18_.alternativa3d::childrenList = _loc19_;
               }
               _loc6_ = _loc19_;
               _loc19_.alternativa3d::setParent(_loc18_);
            }
            else
            {
               _loc12_ = _loc19_.alternativa3d::split(_loc8_,_loc9_,_loc10_,param4);
               _loc13_ = _loc19_.alternativa3d::distance;
               if(_loc12_[0] != null)
               {
                  _loc19_ = _loc12_[0];
                  if(_loc5_ != null)
                  {
                     _loc5_.alternativa3d::next = _loc19_;
                  }
                  else
                  {
                     _loc17_.alternativa3d::childrenList = _loc19_;
                  }
                  _loc5_ = _loc19_;
                  _loc19_.alternativa3d::setParent(_loc17_);
                  _loc19_.alternativa3d::distance = _loc13_;
               }
               if(_loc12_[1] != null)
               {
                  _loc19_ = _loc12_[1];
                  if(_loc6_ != null)
                  {
                     _loc6_.alternativa3d::next = _loc19_;
                  }
                  else
                  {
                     _loc18_.alternativa3d::childrenList = _loc19_;
                  }
                  _loc6_ = _loc19_;
                  _loc19_.alternativa3d::setParent(_loc18_);
                  _loc19_.alternativa3d::distance = _loc13_;
               }
            }
            _loc19_ = _loc7_;
         }
         if(_loc5_ != null)
         {
            _loc17_.calculateBounds();
            _loc14_[0] = _loc17_;
         }
         if(_loc6_ != null)
         {
            _loc18_.calculateBounds();
            _loc14_[1] = _loc18_;
         }
         return _loc14_;
      }
      
      alternativa3d function addToList(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Object3D = null;
         param1.alternativa3d::next = param2;
         param1.alternativa3d::setParent(this);
         if(param2 == this.alternativa3d::childrenList)
         {
            this.alternativa3d::childrenList = param1;
         }
         else
         {
            _loc3_ = this.alternativa3d::childrenList;
            while(_loc3_ != null)
            {
               if(_loc3_.alternativa3d::next == param2)
               {
                  _loc3_.alternativa3d::next = param1;
                  break;
               }
               _loc3_ = _loc3_.alternativa3d::next;
            }
         }
      }
      
      override alternativa3d function setParent(param1:Object3DContainer) : void
      {
         var _loc2_:Object3DContainer = null;
         var _loc3_:Light3D = null;
         if(param1 == null)
         {
            _loc2_ = alternativa3d::_parent;
            while(_loc2_.alternativa3d::_parent != null)
            {
               _loc2_ = _loc2_.alternativa3d::_parent;
            }
            if(_loc2_.alternativa3d::lightList != null)
            {
               this.transferLights(_loc2_,this);
            }
         }
         else if(this.alternativa3d::lightList != null)
         {
            _loc2_ = param1;
            while(_loc2_.alternativa3d::_parent != null)
            {
               _loc2_ = _loc2_.alternativa3d::_parent;
            }
            _loc3_ = this.alternativa3d::lightList;
            while(_loc3_.alternativa3d::nextLight != null)
            {
               _loc3_ = _loc3_.alternativa3d::nextLight;
            }
            _loc3_.alternativa3d::nextLight = _loc2_.alternativa3d::lightList;
            _loc2_.alternativa3d::lightList = this.alternativa3d::lightList;
            this.alternativa3d::lightList = null;
         }
         alternativa3d::_parent = param1;
      }
      
      private function transferLights(param1:Object3DContainer, param2:Object3DContainer) : void
      {
         var _loc3_:Light3D = null;
         var _loc4_:Light3D = null;
         var _loc5_:Light3D = null;
         var _loc6_:Object3D = this.alternativa3d::childrenList;
         while(_loc6_ != null)
         {
            if(_loc6_ is Light3D)
            {
               _loc3_ = _loc6_ as Light3D;
               _loc4_ = null;
               _loc5_ = param1.alternativa3d::lightList;
               while(_loc5_ != null)
               {
                  if(_loc5_ == _loc3_)
                  {
                     if(_loc4_ != null)
                     {
                        _loc4_.alternativa3d::nextLight = _loc5_.alternativa3d::nextLight;
                     }
                     else
                     {
                        param1.alternativa3d::lightList = _loc5_.alternativa3d::nextLight;
                     }
                     _loc5_.alternativa3d::nextLight = param2.alternativa3d::lightList;
                     param2.alternativa3d::lightList = _loc5_;
                     break;
                  }
                  _loc4_ = _loc5_;
                  _loc5_ = _loc5_.alternativa3d::nextLight;
               }
            }
            else if(_loc6_ is Object3DContainer)
            {
               (_loc6_ as Object3DContainer).transferLights(param1,param2);
            }
            if(param1.alternativa3d::lightList == null)
            {
               break;
            }
            _loc6_ = _loc6_.alternativa3d::next;
         }
      }
   }
}


package alternativa.physics.collision
{
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionKdTree2D
   {
      private static const nodeBoundBoxThreshold:AABB = new AABB();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      private static const _nodeBB:Vector.<Number> = new Vector.<Number>(6);
      
      private static const _bb:Vector.<Number> = new Vector.<Number>(6);
      
      public var threshold:Number = 0.1;
      
      public var minPrimitivesPerNode:int = 1;
      
      public var parentTree:CollisionKdTree;
      
      public var parentNode:CollisionKdNode;
      
      public var rootNode:CollisionKdNode;
      
      private var splitAxis:int;
      
      private var splitCost:Number;
      
      private var splitCoord:Number;
      
      public function CollisionKdTree2D(param1:CollisionKdTree, param2:CollisionKdNode)
      {
         super();
         this.parentTree = param1;
         this.parentNode = param2;
      }
      
      public function createTree() : void
      {
         this.rootNode = new CollisionKdNode();
         this.rootNode.boundBox = this.parentNode.boundBox.clone();
         this.rootNode.indices = new Vector.<int>();
         var _loc1_:int = int(this.parentNode.splitIndices.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.rootNode.indices[_loc2_] = this.parentNode.splitIndices[_loc2_];
            _loc2_++;
         }
         this.splitNode(this.rootNode);
         splitCoordsX.length = splitCoordsY.length = splitCoordsZ.length = 0;
      }
      
      private function splitNode(param1:CollisionKdNode) : void
      {
         var _loc2_:Vector.<int> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:AABB = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:AABB = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1.indices.length <= this.minPrimitivesPerNode)
         {
            return;
         }
         _loc2_ = param1.indices;
         _loc5_ = param1.boundBox;
         nodeBoundBoxThreshold.minX = _loc5_.minX + this.threshold;
         nodeBoundBoxThreshold.minY = _loc5_.minY + this.threshold;
         nodeBoundBoxThreshold.minZ = _loc5_.minZ + this.threshold;
         nodeBoundBoxThreshold.maxX = _loc5_.maxX - this.threshold;
         nodeBoundBoxThreshold.maxY = _loc5_.maxY - this.threshold;
         nodeBoundBoxThreshold.maxZ = _loc5_.maxZ - this.threshold;
         var _loc12_:Number = this.threshold * 2;
         var _loc13_:Vector.<AABB> = this.parentTree.staticBoundBoxes;
         var _loc14_:int = int(_loc2_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc14_)
         {
            _loc9_ = _loc13_[_loc2_[_loc3_]];
            if(this.parentNode.axis != 0)
            {
               if(_loc9_.minX > nodeBoundBoxThreshold.minX)
               {
                  var _loc19_:*;
                  splitCoordsX[_loc19_ = _loc6_++] = _loc9_.minX;
               }
               if(_loc9_.maxX < nodeBoundBoxThreshold.maxX)
               {
                  splitCoordsX[_loc19_ = _loc6_++] = _loc9_.maxX;
               }
            }
            if(this.parentNode.axis != 1)
            {
               if(_loc9_.minY > nodeBoundBoxThreshold.minY)
               {
                  splitCoordsY[_loc19_ = _loc7_++] = _loc9_.minY;
               }
               if(_loc9_.maxY < nodeBoundBoxThreshold.maxY)
               {
                  splitCoordsY[_loc19_ = _loc7_++] = _loc9_.maxY;
               }
            }
            if(this.parentNode.axis != 2)
            {
               if(_loc9_.minZ > nodeBoundBoxThreshold.minZ)
               {
                  splitCoordsZ[_loc19_ = _loc8_++] = _loc9_.minZ;
               }
               if(_loc9_.maxZ < nodeBoundBoxThreshold.maxZ)
               {
                  splitCoordsZ[_loc19_ = _loc8_++] = _loc9_.maxZ;
               }
            }
            _loc3_++;
         }
         this.splitAxis = -1;
         this.splitCost = 1e+308;
         _nodeBB[0] = _loc5_.minX;
         _nodeBB[1] = _loc5_.minY;
         _nodeBB[2] = _loc5_.minZ;
         _nodeBB[3] = _loc5_.maxX;
         _nodeBB[4] = _loc5_.maxY;
         _nodeBB[5] = _loc5_.maxZ;
         if(this.parentNode.axis != 0)
         {
            this.checkNodeAxis(param1,0,_loc6_,splitCoordsX,_nodeBB);
         }
         if(this.parentNode.axis != 1)
         {
            this.checkNodeAxis(param1,1,_loc7_,splitCoordsY,_nodeBB);
         }
         if(this.parentNode.axis != 2)
         {
            this.checkNodeAxis(param1,2,_loc8_,splitCoordsZ,_nodeBB);
         }
         if(this.splitAxis < 0)
         {
            return;
         }
         var _loc15_:* = this.splitAxis == 0;
         var _loc16_:* = this.splitAxis == 1;
         param1.axis = this.splitAxis;
         param1.coord = this.splitCoord;
         param1.negativeNode = new CollisionKdNode();
         param1.negativeNode.parent = param1;
         param1.negativeNode.boundBox = _loc5_.clone();
         param1.positiveNode = new CollisionKdNode();
         param1.positiveNode.parent = param1;
         param1.positiveNode.boundBox = _loc5_.clone();
         if(_loc15_)
         {
            param1.negativeNode.boundBox.maxX = param1.positiveNode.boundBox.minX = this.splitCoord;
         }
         else if(_loc16_)
         {
            param1.negativeNode.boundBox.maxY = param1.positiveNode.boundBox.minY = this.splitCoord;
         }
         else
         {
            param1.negativeNode.boundBox.maxZ = param1.positiveNode.boundBox.minZ = this.splitCoord;
         }
         var _loc17_:Number = this.splitCoord - this.threshold;
         var _loc18_:Number = this.splitCoord + this.threshold;
         _loc3_ = 0;
         while(_loc3_ < _loc14_)
         {
            _loc9_ = _loc13_[_loc2_[_loc3_]];
            _loc10_ = _loc15_ ? Number(_loc9_.minX) : (_loc16_ ? Number(_loc9_.minY) : Number(_loc9_.minZ));
            _loc11_ = _loc15_ ? Number(_loc9_.maxX) : (_loc16_ ? Number(_loc9_.maxY) : Number(_loc9_.maxZ));
            if(_loc11_ <= _loc18_)
            {
               if(_loc10_ < _loc17_)
               {
                  if(param1.negativeNode.indices == null)
                  {
                     param1.negativeNode.indices = new Vector.<int>();
                  }
                  param1.negativeNode.indices.push(_loc2_[_loc3_]);
                  _loc2_[_loc3_] = -1;
               }
            }
            else if(_loc10_ >= _loc17_)
            {
               if(_loc11_ > _loc18_)
               {
                  if(param1.positiveNode.indices == null)
                  {
                     param1.positiveNode.indices = new Vector.<int>();
                  }
                  param1.positiveNode.indices.push(_loc2_[_loc3_]);
                  _loc2_[_loc3_] = -1;
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc3_ < _loc14_)
         {
            if(_loc2_[_loc3_] >= 0)
            {
               _loc2_[_loc19_ = _loc4_++] = _loc2_[_loc3_];
            }
            _loc3_++;
         }
         if(_loc4_ > 0)
         {
            _loc2_.length = _loc4_;
         }
         else
         {
            param1.indices = null;
         }
         if(param1.negativeNode.indices != null)
         {
            this.splitNode(param1.negativeNode);
         }
         if(param1.positiveNode.indices != null)
         {
            this.splitNode(param1.positiveNode);
         }
      }
      
      private function checkNodeAxis(param1:CollisionKdNode, param2:int, param3:int, param4:Vector.<Number>, param5:Vector.<Number>) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:AABB = null;
         var _loc18_:int = (param2 + 1) % 3;
         var _loc19_:int = (param2 + 2) % 3;
         var _loc20_:Number = (param5[_loc18_ + 3] - param5[_loc18_]) * (param5[_loc19_ + 3] - param5[_loc19_]);
         var _loc21_:Vector.<AABB> = this.parentTree.staticBoundBoxes;
         var _loc22_:int = 0;
         while(_loc22_ < param3)
         {
            _loc6_ = param4[_loc22_];
            if(!isNaN(_loc6_))
            {
               _loc7_ = _loc6_ - this.threshold;
               _loc8_ = _loc6_ + this.threshold;
               _loc9_ = _loc20_ * (_loc6_ - param5[param2]);
               _loc10_ = _loc20_ * (param5[int(param2 + 3)] - _loc6_);
               _loc11_ = 0;
               _loc12_ = 0;
               _loc13_ = false;
               _loc14_ = int(param1.indices.length);
               _loc15_ = 0;
               while(_loc15_ < _loc14_)
               {
                  _loc17_ = _loc21_[param1.indices[_loc15_]];
                  _bb[0] = _loc17_.minX;
                  _bb[1] = _loc17_.minY;
                  _bb[2] = _loc17_.minZ;
                  _bb[3] = _loc17_.maxX;
                  _bb[4] = _loc17_.maxY;
                  _bb[5] = _loc17_.maxZ;
                  if(_bb[param2 + 3] <= _loc8_)
                  {
                     if(_bb[param2] < _loc7_)
                     {
                        _loc11_++;
                     }
                  }
                  else
                  {
                     if(_bb[param2] < _loc7_)
                     {
                        _loc13_ = true;
                        break;
                     }
                     _loc12_++;
                  }
                  _loc15_++;
               }
               _loc16_ = _loc9_ * _loc11_ + _loc10_ * _loc12_;
               if(!_loc13_ && _loc16_ < this.splitCost && _loc11_ > 0 && _loc12_ > 0)
               {
                  this.splitAxis = param2;
                  this.splitCost = _loc16_;
                  this.splitCoord = _loc6_;
               }
               _loc15_ = _loc22_ + 1;
               while(_loc15_ < param3)
               {
                  if(param4[_loc15_] >= _loc6_ - this.threshold && param4[_loc15_] <= _loc6_ + this.threshold)
                  {
                     param4[_loc15_] = NaN;
                  }
                  _loc15_++;
               }
            }
            _loc22_++;
         }
      }
      
      public function destroyTree() : void
      {
         this.parentTree = null;
         this.parentNode = null;
         if(this.rootNode)
         {
            this.rootNode.destroy();
            this.rootNode = null;
         }
      }
   }
}


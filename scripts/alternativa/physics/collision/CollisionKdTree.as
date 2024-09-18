package alternativa.physics.collision
{
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionKdTree
   {
      private static const nodeBoundBoxThreshold:AABB = new AABB();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      private static const _nodeBB:Vector.<Number> = new Vector.<Number>(6);
      
      private static const _bb:Vector.<Number> = new Vector.<Number>(6);
      
      public var threshold:Number = 0.1;
      
      public var minPrimitivesPerNode:int = 1;
      
      public var rootNode:CollisionKdNode;
      
      public var staticChildren:Vector.<CollisionShape>;
      
      public var numStaticChildren:int;
      
      public var staticBoundBoxes:Vector.<AABB>;
      
      private var splitAxis:int;
      
      private var splitCoord:Number;
      
      private var splitCost:Number;
      
      public function CollisionKdTree()
      {
         this.staticBoundBoxes = new Vector.<AABB>();
         super();
      }
      
      public function createTree(param1:Vector.<CollisionShape>, param2:AABB = null) : void
      {
         var _loc3_:CollisionShape = null;
         var _loc4_:AABB = null;
         this.staticChildren = param1.concat();
         this.numStaticChildren = this.staticChildren.length;
         this.rootNode = new CollisionKdNode();
         this.rootNode.indices = new Vector.<int>();
         var _loc5_:AABB = this.rootNode.boundBox = param2 != null ? param2 : new AABB();
         var _loc6_:int = 0;
         while(_loc6_ < this.numStaticChildren)
         {
            _loc3_ = this.staticChildren[_loc6_];
            _loc4_ = this.staticBoundBoxes[_loc6_] = _loc3_.calculateAABB();
            _loc5_.addBoundBox(_loc4_);
            this.rootNode.indices[_loc6_] = _loc6_;
            _loc6_++;
         }
         this.staticBoundBoxes.length = this.numStaticChildren;
         this.splitNode(this.rootNode);
         splitCoordsX.length = splitCoordsY.length = splitCoordsZ.length = 0;
      }
      
      private function splitNode(param1:CollisionKdNode) : void
      {
         var _loc2_:AABB = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:AABB = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Vector.<int> = param1.indices;
         var _loc9_:int;
         if((_loc9_ = int(_loc8_.length)) <= this.minPrimitivesPerNode)
         {
            return;
         }
         _loc2_ = param1.boundBox;
         nodeBoundBoxThreshold.minX = _loc2_.minX + this.threshold;
         nodeBoundBoxThreshold.minY = _loc2_.minY + this.threshold;
         nodeBoundBoxThreshold.minZ = _loc2_.minZ + this.threshold;
         nodeBoundBoxThreshold.maxX = _loc2_.maxX - this.threshold;
         nodeBoundBoxThreshold.maxY = _loc2_.maxY - this.threshold;
         nodeBoundBoxThreshold.maxZ = _loc2_.maxZ - this.threshold;
         var _loc10_:Number = this.threshold * 2;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc5_ = this.staticBoundBoxes[_loc8_[_loc3_]];
            if(_loc5_.maxX - _loc5_.minX <= _loc10_)
            {
               if(_loc5_.minX <= nodeBoundBoxThreshold.minX)
               {
                  var _loc18_:*;
                  splitCoordsX[_loc18_ = _loc11_++] = _loc2_.minX;
               }
               else if(_loc5_.maxX >= nodeBoundBoxThreshold.maxX)
               {
                  splitCoordsX[_loc18_ = _loc11_++] = _loc2_.maxX;
               }
               else
               {
                  splitCoordsX[_loc18_ = _loc11_++] = (_loc5_.minX + _loc5_.maxX) * 0.5;
               }
            }
            else
            {
               if(_loc5_.minX > nodeBoundBoxThreshold.minX)
               {
                  splitCoordsX[_loc18_ = _loc11_++] = _loc5_.minX;
               }
               if(_loc5_.maxX < nodeBoundBoxThreshold.maxX)
               {
                  splitCoordsX[_loc18_ = _loc11_++] = _loc5_.maxX;
               }
            }
            if(_loc5_.maxY - _loc5_.minY <= _loc10_)
            {
               if(_loc5_.minY <= nodeBoundBoxThreshold.minY)
               {
                  splitCoordsY[_loc18_ = _loc12_++] = _loc2_.minY;
               }
               else if(_loc5_.maxY >= nodeBoundBoxThreshold.maxY)
               {
                  splitCoordsY[_loc18_ = _loc12_++] = _loc2_.maxY;
               }
               else
               {
                  splitCoordsY[_loc18_ = _loc12_++] = (_loc5_.minY + _loc5_.maxY) * 0.5;
               }
            }
            else
            {
               if(_loc5_.minY > nodeBoundBoxThreshold.minY)
               {
                  splitCoordsY[_loc18_ = _loc12_++] = _loc5_.minY;
               }
               if(_loc5_.maxY < nodeBoundBoxThreshold.maxY)
               {
                  splitCoordsY[_loc18_ = _loc12_++] = _loc5_.maxY;
               }
            }
            if(_loc5_.maxZ - _loc5_.minZ <= _loc10_)
            {
               if(_loc5_.minZ <= nodeBoundBoxThreshold.minZ)
               {
                  splitCoordsZ[_loc18_ = _loc13_++] = _loc2_.minZ;
               }
               else if(_loc5_.maxZ >= nodeBoundBoxThreshold.maxZ)
               {
                  splitCoordsZ[_loc18_ = _loc13_++] = _loc2_.maxZ;
               }
               else
               {
                  splitCoordsZ[_loc18_ = _loc13_++] = (_loc5_.minZ + _loc5_.maxZ) * 0.5;
               }
            }
            else
            {
               if(_loc5_.minZ > nodeBoundBoxThreshold.minZ)
               {
                  splitCoordsZ[_loc18_ = _loc13_++] = _loc5_.minZ;
               }
               if(_loc5_.maxZ < nodeBoundBoxThreshold.maxZ)
               {
                  splitCoordsZ[_loc18_ = _loc13_++] = _loc5_.maxZ;
               }
            }
            _loc3_++;
         }
         this.splitAxis = -1;
         this.splitCost = 1e+308;
         _nodeBB[0] = _loc2_.minX;
         _nodeBB[1] = _loc2_.minY;
         _nodeBB[2] = _loc2_.minZ;
         _nodeBB[3] = _loc2_.maxX;
         _nodeBB[4] = _loc2_.maxY;
         _nodeBB[5] = _loc2_.maxZ;
         this.checkNodeAxis(param1,0,_loc11_,splitCoordsX,_nodeBB);
         this.checkNodeAxis(param1,1,_loc12_,splitCoordsY,_nodeBB);
         this.checkNodeAxis(param1,2,_loc13_,splitCoordsZ,_nodeBB);
         if(this.splitAxis < 0)
         {
            return;
         }
         var _loc14_:* = this.splitAxis == 0;
         var _loc15_:* = this.splitAxis == 1;
         param1.axis = this.splitAxis;
         param1.coord = this.splitCoord;
         param1.negativeNode = new CollisionKdNode();
         param1.negativeNode.parent = param1;
         param1.negativeNode.boundBox = _loc2_.clone();
         param1.positiveNode = new CollisionKdNode();
         param1.positiveNode.parent = param1;
         param1.positiveNode.boundBox = _loc2_.clone();
         if(_loc14_)
         {
            param1.negativeNode.boundBox.maxX = param1.positiveNode.boundBox.minX = this.splitCoord;
         }
         else if(_loc15_)
         {
            param1.negativeNode.boundBox.maxY = param1.positiveNode.boundBox.minY = this.splitCoord;
         }
         else
         {
            param1.negativeNode.boundBox.maxZ = param1.positiveNode.boundBox.minZ = this.splitCoord;
         }
         var _loc16_:Number = this.splitCoord - this.threshold;
         var _loc17_:Number = this.splitCoord + this.threshold;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc5_ = this.staticBoundBoxes[_loc8_[_loc3_]];
            _loc6_ = _loc14_ ? Number(_loc5_.minX) : (_loc15_ ? Number(_loc5_.minY) : Number(_loc5_.minZ));
            _loc7_ = _loc14_ ? Number(_loc5_.maxX) : (_loc15_ ? Number(_loc5_.maxY) : Number(_loc5_.maxZ));
            if(_loc7_ <= _loc17_)
            {
               if(_loc6_ < _loc16_)
               {
                  if(param1.negativeNode.indices == null)
                  {
                     param1.negativeNode.indices = new Vector.<int>();
                  }
                  param1.negativeNode.indices.push(_loc8_[_loc3_]);
                  _loc8_[_loc3_] = -1;
               }
               else
               {
                  if(param1.splitIndices == null)
                  {
                     param1.splitIndices = new Vector.<int>();
                  }
                  param1.splitIndices.push(_loc8_[_loc3_]);
                  _loc8_[_loc3_] = -1;
               }
            }
            else if(_loc6_ >= _loc16_)
            {
               if(param1.positiveNode.indices == null)
               {
                  param1.positiveNode.indices = new Vector.<int>();
               }
               param1.positiveNode.indices.push(_loc8_[_loc3_]);
               _loc8_[_loc3_] = -1;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc3_ < _loc9_)
         {
            if(_loc8_[_loc3_] >= 0)
            {
               _loc8_[_loc18_ = _loc4_++] = _loc8_[_loc3_];
            }
            _loc3_++;
         }
         if(_loc4_ > 0)
         {
            _loc8_.length = _loc4_;
         }
         else
         {
            param1.indices = null;
         }
         if(param1.splitIndices != null)
         {
            param1.splitTree = new CollisionKdTree2D(this,param1);
            param1.splitTree.createTree();
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
         var _loc21_:int = 0;
         while(_loc21_ < param3)
         {
            _loc6_ = param4[_loc21_];
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
                  _loc17_ = this.staticBoundBoxes[param1.indices[_loc15_]];
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
               _loc15_ = _loc21_ + 1;
               while(_loc15_ < param3)
               {
                  if(param4[_loc15_] >= _loc6_ - this.threshold && param4[_loc15_] <= _loc6_ + this.threshold)
                  {
                     param4[_loc15_] = NaN;
                  }
                  _loc15_++;
               }
            }
            _loc21_++;
         }
      }
      
      public function traceTree() : void
      {
         this.traceNode("",this.rootNode);
      }
      
      private function traceNode(param1:String, param2:CollisionKdNode) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.traceNode(param1 + "-",param2.negativeNode);
         this.traceNode(param1 + "+",param2.positiveNode);
      }
      
      public function destroyTree() : void
      {
         if(this.rootNode)
         {
            this.rootNode.destroy();
            this.rootNode = null;
         }
         if(this.staticChildren)
         {
            this.staticChildren.length = 0;
            this.staticChildren = null;
         }
         this.staticBoundBoxes.length = 0;
      }
   }
}


package alternativa.physics.contactislands
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.QuickUnionFind;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class IslandsGenerator
   {
      private var physicsScene:PhysicsScene;
      
      public function IslandsGenerator(param1:PhysicsScene)
      {
         this.contactIslands = new Vector.<ContactIsland>();
         this.contactIslandsByRootId = new Dictionary();
         this.uf = new QuickUnionFind();
         super();
         this.physicsScene = param1;
      }
      
      public function generate(param1:Vector.<BodyContact>, param2:int) : void
      {
         this.createUnions(param1,param2);
         this.createIslands(param1);
      }
      
      private function createUnions(param1:Vector.<BodyContact>, param2:int) : void
      {
         var _loc3_:BodyContact = null;
         this.uf.init(param2);
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.body1.movable && _loc3_.body2.movable)
            {
               this.uf.union(_loc3_.body1.id,_loc3_.body2.id);
            }
            _loc5_++;
         }
      }
      
      private function createIslands(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:int = 0;
         var _loc4_:ContactIsland = null;
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = param1[_loc6_];
            if(_loc2_.body1.movable)
            {
               _loc3_ = this.uf.root(_loc2_.body1.id);
            }
            else
            {
               _loc3_ = this.uf.root(_loc2_.body2.id);
            }
            _loc4_ = this.contactIslandsByRootId[_loc3_];
            if(_loc4_ == null)
            {
               _loc4_ = ContactIsland.create();
               this.contactIslands[this.contactIslands.length] = _loc4_;
               this.contactIslandsByRootId[_loc3_] = _loc4_;
            }
            _loc4_.bodyContacts[_loc4_.bodyContacts.length] = _loc2_;
            _loc6_++;
         }
         var _loc7_:int = int(this.contactIslands.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_ = this.contactIslands[_loc8_];
            _loc4_.init(this.physicsScene);
            _loc8_++;
         }
         clearDictionary(this.contactIslandsByRootId);
      }
      
      public function clear() : void
      {
         var _loc1_:ContactIsland = null;
         var _loc2_:int = int(this.contactIslands.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.contactIslands[_loc3_];
            _loc1_.dispose();
            _loc3_++;
         }
         this.contactIslands.length = 0;
      }
   }
}


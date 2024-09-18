package alternativa.proplib.types
{
   public class PropGroup
   {
      public var name:String;
      
      public var props:Vector.<PropData>;
      
      public var groups:Vector.<PropGroup>;
      
      public function PropGroup(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function getPropByName(param1:String) : PropData
      {
         var _loc2_:PropData = null;
         if(this.props == null)
         {
            return null;
         }
         for each(_loc2_ in this.props)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getGroupByName(param1:String) : PropGroup
      {
         var _loc2_:PropGroup = null;
         if(this.groups == null)
         {
            return null;
         }
         for each(_loc2_ in this.groups)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addProp(param1:PropData) : void
      {
         if(this.props == null)
         {
            this.props = new Vector.<PropData>();
         }
         this.props.push(param1);
      }
      
      public function addGroup(param1:PropGroup) : void
      {
         if(this.groups == null)
         {
            this.groups = new Vector.<PropGroup>();
         }
         this.groups.push(param1);
      }
      
      public function traceGroup() : void
      {
         var _loc1_:PropGroup = null;
         var _loc2_:PropData = null;
         if(this.groups != null)
         {
            for each(_loc1_ in this.groups)
            {
               _loc1_.traceGroup();
            }
         }
         if(this.props != null)
         {
            for each(_loc2_ in this.props)
            {
               _loc2_.traceProp();
            }
         }
      }
   }
}


package Renamed1583
{
   import Renamed1614.Renamed1615;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed4758 implements Renamed1584
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed1584>;
      
      public function Renamed4758(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed1584>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2080() : Vector.<IGameObject>
      {
         var Renamed2142:Vector.<IGameObject> = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed2080();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function getName() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getName();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function Renamed1594() : String
      {
         var Renamed2142:String = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed1594();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed1595() : int
      {
         var Renamed2142:int = 0;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed1595();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function getMaxRank() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMaxRank();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getMinRank() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMinRank();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getThemeName() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getThemeName();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function Renamed1596() : Renamed1615
      {
         var Renamed2142:Renamed1615 = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed1596();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed1597() : Vector.<Renamed1587>
      {
         var Renamed2142:Vector.<Renamed1587> = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed1597();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function isEnabled() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isEnabled();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getAdditionalCrystalsPercent() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getAdditionalCrystalsPercent();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPreviewResource() : ImageResource
      {
         var result:ImageResource = null;
         var i:int = 0;
         var m:Renamed1584 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPreviewResource();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}


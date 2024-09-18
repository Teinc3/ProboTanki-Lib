package Renamed403
{
   import Renamed602.3DPositionVector;
   import Renamed306.Renamed1344;
   import Renamed306.Renamed2521;
   import Renamed306.Renamed2405;
   import Renamed306.Renamed2406;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Renamed4703 implements Renamed2414
   {
      private var object:IGameObject;
      
      private var impl:Renamed2414;
      
      public function Renamed4703(param1:IGameObject, param2:Renamed2414)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2495() : MapResource
      {
         var Renamed2142:MapResource = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2495();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8561() : SoundResource
      {
         var Renamed2142:SoundResource = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8561();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8562() : Renamed2521
      {
         var Renamed2142:Renamed2521 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8562();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed831() : Number
      {
         var Renamed2142:Number = NaN;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed831();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8563() : 3DPositionVector
      {
         var Renamed2142:3DPositionVector = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8563();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8564() : Number
      {
         var Renamed2142:Number = NaN;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8564();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8565() : Renamed2406
      {
         var Renamed2142:Renamed2406 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8565();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8566() : Renamed2405
      {
         var Renamed2142:Renamed2405 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8566();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8567() : Renamed1344
      {
         var Renamed2142:Renamed1344 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8567();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed8568() : uint
      {
         var Renamed2142:uint = 0;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed8568();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}


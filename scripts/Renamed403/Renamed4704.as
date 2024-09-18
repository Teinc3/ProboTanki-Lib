package Renamed403
{
   import Renamed602.3DPositionVector;
   import Renamed306.Renamed1344;
   import Renamed306.Renamed2521;
   import Renamed306.Renamed2405;
   import Renamed306.Renamed2406;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Renamed4704 implements Renamed2414
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2414>;
      
      public function Renamed4704(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2414>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2495() : MapResource
      {
         var Renamed2142:MapResource = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed2495();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8561();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8562();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed831();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8563();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8564();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8565();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8566();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8567();
               Renamed2143++;
            }
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
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2414 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed8568();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}


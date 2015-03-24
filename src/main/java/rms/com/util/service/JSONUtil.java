package rms.com.util.service;

import com.google.gson.Gson;

public class JSONUtil
{
   private static Gson gson = new Gson();
   public static String toJson(Object obj)
   {
      return gson.toJson(obj);
   }
}

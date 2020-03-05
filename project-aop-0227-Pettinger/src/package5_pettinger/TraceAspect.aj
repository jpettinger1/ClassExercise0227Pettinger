package package5_pettinger;

public aspect TraceAspect {
   pointcut classToTrace(): within(DataApp) || within(ServiceApp) || within(ComponentApp);

   //pointcut constructorToTrace(): classToTrace() && execution(new(..));

   pointcut methodToTrace():  classToTrace() &&  execution(String getName());


   before(): methodToTrace() {
      System.out.println("\t-->" + thisJoinPointStaticPart.getSignature() + //
            ", Line " + thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}

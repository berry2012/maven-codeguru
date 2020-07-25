    boolean isValidLength(String value, int length){
        return value.length() == length;
    }
    boolean isValidDate(String value) {
        return !StringUtils.isBlank(value) && value.matches("\\d{4}-\\d{2}-\\d{2}");
    }
    public void validateAuthRequest(@NonNull PaymentAuthFlow authFlow, TransactionAuthRequest request) {
 
         if(authFlow.getAuthField() == AuthField.SECRET) {
           String decrypted = sslUtil.decrypt(request.getValue());


private LocalContainerEntityManagerFactoryBean entityManagerFactory;
    @Autowired
    private RedisProperties redisProperties;
    public static void main(String[] args) {
        SpringApplication.run(CentralBillingPlatformApplication.class, args);
    }
    @Bean
    public JpaTransactionManager transactionManager() {


        }
    }
    public String hashString(String plainString) {
        byte[] saltedBytes = plainString.getBytes();
        return DigestUtils.sha256Hex(saltedBytes);
    }
}


     }
    }
    @Override
    public String generateReference(String billReference) {
        return configuration.getRequestReferencePrefix() + RandomStringUtils.randomNumeric(10);
    }
    @Override
    public Set<String> getSupportedCurrencies() {
        return configuration.getSupportedCurrencies();
# mojo-demo
## Background
![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/2084899d-7c8e-44f7-af71-fe6aed0db2f0)

## lasagna architecture examples
* OSI network layers

![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/d07c681b-908f-449d-9748-d2f90eb93016)

* Programming language layers

![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/c6b8cf13-8d5e-47fb-8b72-52c215904ebd)

* The underlying implmentations matter
  * They generated the same results with different speed
 
```sql
select count(*) from Deposits
inner join households on households.id = deposits.HouseholdId
where CashierId = 'd89c8029-4808-4cea-b505-efd8279dc66d'
```

The above SQL scripts can have different execution plan

|---|
| possible execution plan 1 |
| ![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/2c4600fd-9b65-46d5-8f04-26044fddadd4) |
| possible execution plan 2 |
| ![image](https://github.com/HemingwayLee/mojo-demo/assets/8428372/57268c5b-1dce-4d47-b7b7-2e9f2415e9c4) |
|---|



- Checking **Partial correlation coefficient** of `sqft_living15` and `price`

```{r}
# without sqft_living15
model1 = lm(price ~ bedrooms + bathrooms + sqft_living + sqft_lot + sqft_basement + sqft_lot15 + yr_built, data = reducedHouseData)

# without price
model2 = lm(sqft_living15 ~ bedrooms + bathrooms + sqft_living + sqft_lot + sqft_basement + sqft_lot15 + yr_built, data = reducedHouseData )

cor(resid(model2), resid(model1))
```

- Checking **Partial correlation coefficient** of `sqft_living` and `price`

```{r}
# Without sqft_living
model1 = lm(price ~ bedrooms + bathrooms + sqft_living15 + sqft_lot + sqft_basement + sqft_lot15 + yr_built, data = reducedHouseData)

# without price
model2 = lm(sqft_living ~ bedrooms + bathrooms + sqft_living15 + sqft_lot + sqft_basement + sqft_lot15 + yr_built, data = reducedHouseData )

cor(resid(model2), resid(model1))

```

- Checking **Partial correlation coefficient** of `sqft_lot15` and `price`

```{r}
# Without sqft_lot15
model1 = lm(price ~ bedrooms + bathrooms + sqft_living15 + sqft_living + sqft_lot + sqft_basement + yr_built, data = reducedHouseData)

# without price
model2 = lm(sqft_lot15  ~ bedrooms + bathrooms + sqft_living15 + sqft_living + sqft_lot + sqft_basement + yr_built, data = reducedHouseData )

cor(resid(model2), resid(model1))
```

- Checking **Partial correlation coefficient** of `sqft_lot` and `price`

```{r}
# Without sqft_lot15
model1 = lm(price ~ bedrooms + bathrooms + sqft_living15 + sqft_living + sqft_lot15 + sqft_basement + yr_built, data = reducedHouseData)

# without price
model2 = lm(sqft_lot  ~ bedrooms + bathrooms + sqft_living15 + sqft_living + sqft_lot15 + sqft_basement + yr_built, data = reducedHouseData )

cor(resid(model2), resid(model1))
```

- **Result** From Partial correlation coefficients, we can say that having sqft_lot and sqft_lot15 in the model do not seem to add any value.
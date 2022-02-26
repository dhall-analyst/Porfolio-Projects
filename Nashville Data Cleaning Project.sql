--Cleaning Data in SQL Queries 


Select *
From PortfolioProject..NashvilleHousingData

-- Standardize Date Format

Select SaleDate
From PortfolioProject..NashvilleHousingData

Select SaleDateconverted, CONVERT(date,Saledate) 
From PortfolioProject..NashvilleHousingData

ALTER TABLE PortfolioProject..NashvilleHousingData
Add SaleDateConverted Date; 

Update PortfolioProject..NashvilleHousingData
Set SaleDateConverted = convert (date,saledate)

-----------Populate Property Address Data

Select *
From PortfolioProject..NashvilleHousingData
--where PropertyAddress is null	
order by ParcelID

Select a.ParcelID, a.propertyaddress, b.ParcelId, b.PropertyAddress, ISNULL(a.propertyaddress, b.PropertyAddress)
From PortfolioProject..NashvilleHousingData a
JOIN PortfolioProject..NashvilleHousingData b
on a.ParcelID = b.ParcelID
AND a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null


Update a
sET PropertyAddress=ISNULL(a.propertyaddress, b.PropertyAddress)
From PortfolioProject..NashvilleHousingData a
JOIN PortfolioProject..NashvilleHousingData b
on a.ParcelID = b.ParcelID
AND a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null


------------------------------------------------------------------------------------------------
--Breaking out Address Into Individual Colums (Address, City, State)

Select PropertyAddress
From PortfolioProject..NashvilleHousingData
--where PropertyAddress is null	
--order by ParcelID

Select
Substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Address
, Substring(PropertyAddress, charindex(',', PropertyAddress) +1, len(PropertyAddress)) as Address 

From PortfolioProject..NashvilleHousingData

ALTER TABLE PortfolioProject..NashvilleHousingData
Add PropertySplitAddress Nvarchar(255);

Update PortfolioProject..NashvilleHousingData
Set PropertySplitAddress = Substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1) 

ALTER TABLE PortfolioProject..NashvilleHousingData
Add PropertySplitCity Nvarchar(255); 

Update PortfolioProject..NashvilleHousingData
Set PropertySplitCity = Substring(PropertyAddress, charindex(',', PropertyAddress) +1, len(PropertyAddress)) 

select*
from PortfolioProject..NashvilleHousingData

select OwnerAddress
from PortfolioProject..NashvilleHousingData

Select
Parsename(Replace(OwnerAddress, ',', '.') , 3)
, Parsename(Replace(OwnerAddress, ',', '.') , 2)
, Parsename(Replace(OwnerAddress, ',', '.') , 1)
from PortfolioProject..NashvilleHousingData

ALTER TABLE PortfolioProject..NashvilleHousingData
Add OwnerSplitAddress Nvarchar(255);

Update PortfolioProject..NashvilleHousingData
Set OwnerSplitAddress = Parsename(Replace(OwnerAddress, ',', '.') , 3)

ALTER TABLE PortfolioProject..NashvilleHousingData
Add OwnerSplitCity Nvarchar(255); 

Update PortfolioProject..NashvilleHousingData
Set OwnerSplitCity = Parsename(Replace(OwnerAddress, ',', '.') , 2)

ALTER TABLE PortfolioProject..NashvilleHousingData
Add OwnerSplitState Nvarchar(255); 

Update PortfolioProject..NashvilleHousingData
Set OwnerSplitState = Parsename(Replace(OwnerAddress, ',', '.') , 1)

select*
from PortfolioProject..NashvilleHousingData
--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field

Select *
from PortfolioProject..NashvilleHousingData

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject..NashvilleHousingData
Group by SoldAsVacant
order by 2

Select SoldAsVacant
, Case when SoldAsVacant ='Y' then 'Yes'
	When SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	END
from PortfolioProject..NashvilleHousingData 

Update PortfolioProject..NashvilleHousingData 
Set SoldAsVacant = Case when SoldAsVacant ='Y' then 'Yes'
	When SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	END

Select *
from PortfolioProject..NashvilleHousingData

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates (Need to Troubleshoot this but this is what the SQL shoud look like)

With RowNumCTE as (
Select *,

ROW_NUMBER() Over (
	Partition by ParcelID,
				Propertyaddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order by
					uniqueID
					) Row_num

From PortfolioProject..NashvilleHousingData
--Order by ParcelID
)
--Delete
--From RowNumCTE
--where row_num > 1
--order by PropertyAddress

select*
From RowNumCTE
Where row_num > 1
order by PropertyAddress

	
---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

select *
From PortfolioProject..NashvilleHousingData

Alter table PortfolioProject..NashvilleHousingData
Drop Column OwnerAddress, TaxDistrict, PropertyAddress

Alter table PortfolioProject..NashvilleHousingData
Drop Column SaleDate
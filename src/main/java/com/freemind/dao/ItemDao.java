package com.freemind.dao;

import java.util.List;

import com.freemind.model.Item;

public interface ItemDao {
	public List<Item> getAllItemList();

	public Item getItemById(int id);

	public void save(Item item);

	public void update(Item item);

	public void deleteItemById(int id);
}

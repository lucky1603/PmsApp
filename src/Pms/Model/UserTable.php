<?php

namespace Pms\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Exception;
use Zend\Db\Sql\Select;

class UserTable
{
    protected $tableGateway;
    
    public function __construct(TableGateway $tableGateway) {        
        $this->tableGateway = $tableGateway;
    }
    
    public function saveUser(User $user)
    {
        $data  = array(
          'email' => $user->email,
          'username' => $user->username,
          'password' => $user->password, 
          'role_id' => $user->role_id,
        );
        $id = (int) $user->id;
        if($id == 0) {
            // upisi user-a
            //$this->tableGateway->insert($data);
        }
        else {
            if($this->getUser($id))
            {
                // Update-uj user-a
                $this->tableGateway->update($data, ['id' => $id]);
            }
            else 
            {
                throw new \Exception('User ID doesn\'t exist!');
            }
        }
    }
    
    public function getUser($id)
    {
        // Daj user-a po id-u
        $id = (int) $id;
        $rowset = $this->tableGateway->select(['id' => $id]);
        $row = $rowset->current();
        if(!$row) {
            throw new \Zend\Db\Exception('Could not find row ' . $id);
        }
        return $row;
    }
    
    public function fetchAll()
    {
        // Daj sve user-e
        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }
    
    public function fetchView()
    {
        $dbAdapter = $this->tableGateway->getAdapter();
        $statement = $dbAdapter->query('SELECT u.id, u.username, u.email, r.name, r.name FROM "user" as u, "role" as r WHERE u.role_id = r.id');
        $results = $statement->execute();
        $rows = array();
        do {
            $rows[] = $results->current();
        } while($results->next());
        return $rows;
    }
    
    public function getUserByEmail($userMail)
    {
        // Daj user-a po mail-u
        $resultSet = $this->tableGateway->select(['email' => $userMail]);
        $row = $resultSet->current();
        if(! $row) {
            throw new Exception("Couldn't find row with " . $userMail . " mail.");
        }
        return $row;
    }
    
    public function getUserByRole($role_id)
    {
        $resultSet = $this->tableGateway->select(['role_id' => $role_id]);
        if($resultSet->count() == 0)
        {
            throw new Exception("Couldn't find user with role " . $role_id . ".");
        }
        return $resultSet->toArray();
    }
    
    public function deleteUser($id)
    {
        // izbrisi user-a
        $this->tableGateway->delete(['id' => $id]);
    }
}

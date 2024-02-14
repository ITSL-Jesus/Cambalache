<?php

namespace App\Http\Livewire;

use App\Models\User;
use Livewire\Component;

class SearchBar extends Component
{
    public $searchTerm = '';
    public $users = [];

    public function render()
    {
        if (!empty($this->searchTerm)) {
            $this->users = User::where('username', 'LIKE', '%' . $this->searchTerm . '%')->get();
        } else {
            $this->users = [];
        }

        return view('livewire.search-bar');
    }
}


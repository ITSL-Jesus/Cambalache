<div class="relative">
    <input type="text" wire:model="searchTerm" placeholder="Buscar" class="px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">

    @if (!empty($searchTerm) && count($users) > 0)
        <ul class="mt-2 bg-white shadow-lg max-w-xs rounded-md absolute z-10 w-full">
            @foreach ($users as $user)
                <li>
                    <a href="{{ route('posts.index', $user->username) }}" class="block px-4 py-2 hover:bg-blue-500 hover:text-white">{{ $user->username }}</a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
